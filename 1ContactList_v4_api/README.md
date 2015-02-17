## Contact List CRUD App - Version 4 - API edition
- An API that allows users to create/retrieve/update/delete contacts.
- Created in the 5th week of Lighthouse Labs coding bootcamp
- Built using Sinatra framework, uses jQuery to talk to the server

###*Example code*:
- routes - [/app/actions.rb](https://github.com/3mily/Contact-List/blob/master/1ContactList_v4_api/app/actions.rb)
- AJAX requests - [/public/javascript/application.js](https://github.com/3mily/Contact-List/blob/master/1ContactList_v4_api/public/javascript/application.js)


###*Documentation*: 
####- Create New Contact 
- *URL:* **API_URL/api**
- *Method*: **POST**
- *Params*: **{"name": "Emily", "email": "emily@foo.com", "phone": "555-5555"}**
- *Valid Request(200) - Body returned*: **{"id": 1, "name": "Emily", "email": "emily@foo.com", "phone": "555-5555"}**
- *Invalid Request(400) - Body returned*: **{ error : "oh noes"}**

####- Update Contact 
- *URL:* **API_URL/api/:id**
- *Method*: **PUT**
- *Params*: **{"name": "EmilyNew", "email": "emilyNew@foo.com", "phone": "555-6666"}**
- *Valid Request(200) - Body returned*: **{
"name": "EmilyNew", "email": "emilyNew@foo.com", "phone": "555-6666"}**
- *Invalid Request(400) - Body returned*: **{ error : "oh noes"}**

####- Show Contacts
- *URL:* **API_URL/api**
- *Method*: **GET**
- *Params*: **none**
- *Valid Request(200) - Body returned*: **[ {"name": "Emily", ... }, {"name: "Mario", ... } ] **
- *Invalid Request(400) - Body returned*: **{ error : "oh noes"}**
 

####- Delete Contact 
- *URL:* **API_URL/api/:id**
- *Method*: **DELETE**
- *Params*: **none**
- *Valid Request(200) - Body returned*: **none**
- *Invalid Request(400) - Body returned*: **{ error : "oh noes"}**

Enjoy your contact list!