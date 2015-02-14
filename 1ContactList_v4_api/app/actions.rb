# Homepage (Root path)


require 'pry'



get '/' do
  erb :index
end


post '/api/new' do

  contact = Contact.new(params)
  contact.save

  contact.to_json

end


get '/api/list' do

  contacts = Contact.all
  contacts.to_json

end

get '/api/search/:id' do
  contact = Contact.find_by(id: params[:id].to_i)

  # binding.pry
  content_type 'application/json'
  contact.to_json
end