

class Contact
 

  @@contact_list = []
  attr_accessor :name, :email, :id_number, :phone, :contact_list


  def initialize(id_number, name, email, phone={})
    @name = name
    @email = email
    @id_number = id_number
    @phone = phone
  end
 
  def to_a
    [@id_number,@name,@email,@phone]
  end

#------ class methods below #------

  # class << self # same as .self
  #   def create(id_number, name, email)
  #     new_contact = Contact.new(id_number, name, email)
  #     new_contact
  #   end
  # end

end


