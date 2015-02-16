require_relative 'contact'
require_relative 'contact_database'


command = ARGV[0]


case command
  when "help"
    print "Here is a list of available commands:
    new  - Create a new contact
    list - List all contacts
    show - Show a contact based on ID#
    find - Find a contact based on any keyword
    add - Add to phone number"

  when "new"
    puts "Add new contact."
    print "E-Mail: "
    @email = STDIN.gets.chomp
    ContactDatabase.duplicate(@email)
    print "Name: "
    name = STDIN.gets.chomp
    print "Phone Number: "
    phone_num = STDIN.gets.chomp
    print "Phone type: "
    phone_type = STDIN.gets.chomp.to_sym

    last_id_num = ContactDatabase.make_contact[-1].id_number
    new_id_num = last_id_num + 1
    new_contact = Contact.new(new_id_num, name, @email)
    new_contact.phone[phone_type] = phone_num
    puts "New Contact created. ID: #{new_contact.id_number}"
    new_contact = new_contact.to_a
    ContactDatabase.write_to_csv(new_contact)

  when "list"
   ContactDatabase.list
  
  when "find"
    keyword = ARGV[1]
    CSV.foreach('people.csv', "r") do |row|
      if row.include?(keyword) # if something matches
        id_num = row[0].to_i
        name = row[1]
        email = row[2]
        @output = "ID: #{id_num} - #{name} - #{email}"
      end
    end
    @output ||= "No contact with keyword '#{keyword}'."
    puts @output

  when "show"
    keyword = ARGV[1].to_i
    ContactDatabase.make_contact.each do |contact|
      if contact.id_number == keyword
        @output = "ID: #{contact.id_number} - #{contact.name} - #{contact.email}"
      end
    end
    @output ||= "No contact with ID# '#{keyword}'."
    puts @output

  when "add"
    print "ID # of Contact to add phone number to: "
    id = STDIN.gets.chomp.to_i
    ContactDatabase.make_contact.each do |contact|
      if contact.id_number == id
        print "phone number: "
        phone_num = STDIN.gets.chomp
        print "Phone type: "
        phone_type = STDIN.gets.chomp.to_sym
        contact.phone[phone_type] = phone_num
        @output = "ID # #{id} - new number added."
      end
    end
  @output ||= "No contact with ID# '#{id}'."
  puts @output
end






