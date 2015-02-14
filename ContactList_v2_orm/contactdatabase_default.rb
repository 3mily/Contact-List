require 'pg'


# please put in your own information :)

class ContactDatabase 

  def self.new # shouldn't use new here, actually - does not follow singleton pattern
    PG.connect(dbname: yourDatabaseName,
                  host: HostURL,
                  port: portNumber,
                  user: userName,
                  password: password)
  end
end
