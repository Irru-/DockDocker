class Server < ActiveRecord::Base
  def self.getServersFromAPI
    response = JSON.parse(HTTParty.get("http://13.82.59.32:4567/Servers").body)

    response.each do |server|
      if where(id: server["id"]).empty?
        newServer       = Server.new
        newServer.id    = server["id"]
        newServer.name  = server["name"]
        newServer.ip4   = server["ipv4"]
        newServer.save
      end
    end
  end
end
