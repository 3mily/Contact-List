require 'active_record'
require_relative 'contacts'


# please put in your own information :)


ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
 adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: yourDatabase,
  username: userName,
  password: password,
  host: host,
  port: portNumber,
  min_messages: 'error')

puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.table_exists?(:contacts)
    create_table :contacts do |t|
      t.column :firstname, :string
      t.column :lastname, :string
      t.column :email, :string
      t.timestamps
    end
  end
  unless ActiveRecord::Base.connection.table_exists?(:phones)
    create_table :phones do |t|
      t.references :contact
      t.column :phone_type, :string
      t.column :number, :string
      t.timestamps
    end
  end
end

puts "Setup DONE"
