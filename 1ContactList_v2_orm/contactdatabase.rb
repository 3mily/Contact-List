require 'pg'

class ContactDatabase

  def self.new # shouldn't use new here, actually - does not follow singleton pattern
    PG.connect(dbname: 'd9g4gf4gsfcjdi',
                  host: 'ec2-50-16-190-77.compute-1.amazonaws.com',
                  port: 5432,
                  user: 'yukmvlbphylogs',
                  password: 'FAO9TyQoTRnuwqxE2u4kiuLJPF')
  end
end
