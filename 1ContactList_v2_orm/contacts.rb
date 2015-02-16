require './contactdatabase'

class Contact
  attr_accessor :firstname,
                :lastname,
                :email,
                :phone_type,
                :phone_number
  attr_reader :id

  def initialize(firstname, lastname, email, phone_type=nil, phone_number=nil, id=nil)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @phone_type = phone_type
    @phone_number = phone_number
    @id = id
  end

  def save
    if @id == nil
      sql = "INSERT INTO contacts (firstname,lastname,email) VALUES ($1, $2, $3) RETURNING id"
      row = self.class.connection.exec_params(sql, [firstname, lastname, email])
      @id = row[0]["id"].to_i

      sql = "INSERT INTO phones (type,number,id) VALUES ($1, $2, $3)"
      row = self.class.connection.exec_params(sql, [phone_type, phone_number, @id])

    else
      sql = "UPDATE phones SET type=$1, number=$2 WHERE id = $3"
      self.class.connection.exec_params(sql, [phone_type, phone_number, contact_id])

      sql = "UPDATE contacts SET firstname=$1::TEXT, lastname=$2::TEXT, email=$3::TEXT, WHERE id = $4"
      self.class.connection.exec_params(sql, [firstname, lastname, email, id])
      true
    end
  rescue PG::Error => e
    false
  end

  def destroy
    sql = "DELETE FROM contacts WHERE id = $1"
    self.class.connection.exec_params(sql, [id])
    true
  rescue PG::Error => e
    false
  endgit 


  class << self
    def connection
     ContactDatabase.new
    end 

    def create(r)
      Contact.new(r['firstname'],r['lastname'],r['email'],r['phone'],r['id'])
    end

    def all # return array of contact instances
      sql = "SELECT * FROM contacts" 
      connection.exec(sql) do |rows|
        rows.collect do |row|
          Contact.create(row)
        end
      end
    end

    def find(id)
      found_contact = nil
      contact = connection.exec("SELECT * FROM contacts WHERE id = #{id}")
      row = contact[0]
      found_contact = Contact.create
    end

    def find_by_email(email)
      found_contact = nil
      contact = connection.exec("SELECT * FROM contacts WHERE email = '#{email}'")
      row = contact[0]
      found_contact = Contact.create
    end

    def find_all_by_lastname(lastname)
      sql = "SELECT * FROM contacts WHERE lastname = '#{lastname}'"
      connection.exec(sql) do |rows|
        rows.collect do |row|
           found_contact << Contact.create
        end
      end
    end

    def find_all_by_firstname(firstname)
      found_contact = []
      sql = "SELECT * FROM contacts WHERE firstname = '#{firstname}'"
      connection.exec(sql) do |rows|
        rows.each do |row|
           found_contact << Contact.create
        end
      end
      found_contact
    end

  end
end
