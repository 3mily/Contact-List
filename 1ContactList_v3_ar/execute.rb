require_relative 'contactdatabase'

class Application

  def self.run
    print "Welcome to Contacts List 3.0! Here is a list of available commands:
    new  - Add a new contact
    update - Update information of an existing contact by ID
    all - List all contacts
    delete - delete a contact by ID
    find - find a contact by ID
    search - search a contact by lastname

    Enter command: "
    command = gets.chomp

    loop do
      case command
      when "new"
        puts "Add new contact."
        print "First Name: "
        firstname = gets.chomp
        print "Last Name: "
        lastname = gets.chomp
        email = ""
        loop do
          print "E-Mail: "
          email = gets.chomp
          if Contact.exists?(email: email)
            puts "E-Mail already taken. Please enter another."
          else
            break loop
          end
        end
        new_contact = Contact.create(firstname: firstname, lastname: lastname, email: email)
        print "Phone Number: "
        number = gets.chomp
        print "Phone type: "
        phone_type = gets.chomp

        new_contact.phones.create(phone_type: phone_type, number: number)
        puts "New Contact created. ID: #{new_contact.id}"

      when "update"
        Contact.update(id, firstname: 'something')

      when "delete"
        puts "id?: "
        Contact.delete(gets.chomp)


      when "all"
        Contact.all.each do |contact|
          contact.print
        end
    
      when "find"
        print "Find by ID: "
        id = gets.chomp.to_i
        if Contact.exists?(id: id) 
          Contact.find(id).print
        else
          puts "No Contact with ID# #{id}."
        end

      when "exit", "quit"
        break loop
      end
    end
  end
end

Application.run