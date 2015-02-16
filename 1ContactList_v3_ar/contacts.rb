class Contact < ActiveRecord::Base
  has_many :phones
  validates :firstname, :lastname, :email, presence: true
  validates :firstname, :lastname, length: {maximum: 50}
  validates :email, uniqueness: true
  validates :email, length: {maximum: 150}

  def print
    puts "ID: #{id}, Name: #{firstname} #{lastname}, E-Mail: #{email}"
    phones.each do |phone|
      puts "Phone type: #{phone.phone_type}, Number: #{phone.number}"
      end
    end
end

class Phone < ActiveRecord::Base
  belongs_to :contact
  validates :phone_type, :number, presence: true
end