require_relative 'contactdatabase'





    # new  - Add a new contact
    # update - Update information of an existing contact by ID
    # all - List all contacts
    # delete - delete a contact by ID
    # find - find a contact by ID
    # search - search a contact by lastname


em = Contact.create(firstname: 'Hello', lastname: "Byebye", email: "em@em")
em.save

em.phone.create(number: asdf)
ems_phone = Phone.create( number: ifsdjf)
ems_phone.contact 

