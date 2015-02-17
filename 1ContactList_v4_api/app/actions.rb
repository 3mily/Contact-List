get '/' do
  erb :index
end

#--------- [POST]route --------
post '/api' do
  contact = Contact.new(params)
  contact.save
  contact.to_json
end

#--------- [GET] route --------
get '/api/:id' do # -- find one
  contact = Contact.find_by(id: params[:id].to_i)
  content_type 'application/json'
  contact.to_json
end
get '/api/list' do # -- list all
  contacts = Contact.all
  contacts.to_json
end

#--------- [PUT] route --------
put '/api/:id' do
  contact = Contact.find(params[:id])
    contact.update(
    name:   params[:name],
    email:  params[:email],
    phone: params[:phone]
    )
end

#--------- [DELETE] route --------
delete '/api/:id' do
  contact = Contact.find(params[:id])
  contact.destroy
end 