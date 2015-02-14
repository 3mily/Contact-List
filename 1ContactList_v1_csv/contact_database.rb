## TODO: Implement CSV reading/writing
require 'csv'

require'pry'
class ContactDatabase


  attr_reader :rows, :contact_list
  def self.write_to_csv(contact)
    CSV.open('people.csv', "a") do |file|
      file << contact
    end
  end

  def self.list_csv
    CSV.foreach('people.csv', "r") do |row|
      rows = row.inspect
      puts rows
    end
  end

  def self.list
    ContactDatabase.make_contact.each do |contact|
      puts "ID: #{contact.id_number} - #{contact.name} - #{contact.email} #PHONE: #{contact.phone}"
    end
  end

  def self.make_contact
    contact_list = []
    CSV.foreach('people.csv', "r") do |row|
        id_num = row[0].to_i
        name = row[1]
        email = row[2]
        phone = row[3]
        phone = eval(phone || '')
        contact_list << Contact.new(id_num, name, email, phone)
    end
    contact_list
  end

  def self.duplicate(email_to_check)
    @email = email_to_check
    loop do
      @duplicate_found = false
      ContactDatabase.make_contact.each do |contact|
        if contact.email == @email
          begin
            raise StandardError, "duplicate email address"
          rescue
             @duplicate_found = true
             puts "That e-mail address is already registered."
             print "E-Mail: "
             @email = STDIN.gets.chomp
          end # exception
        end # if 
      end # each do
    break loop if @duplicate_found == false 
    end # loop do
    @email
  end # duplicate method


  def self.show(id)
    ContactDatabase.make_contact.each do |row|
      if row.include?(keyword)
        result = row
      end
    end
    result
  end
end