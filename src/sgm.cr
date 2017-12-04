require "http/client"
require "json"
require "./sgm/*"

module SGM
  # URL to server JSON
  SERVERS_URL = "https://www.seriousgmod.com/servers/json"

  # Get a list of all the servers
  # @return Array(Server)
  def self.servers
    resp = HTTP::Client.get SERVERS_URL
    parser = JSON::PullParser.new(resp.body)

    results = [] of Server

    parser.on_key("servers") { parser.read_array { results << Server.from_json(parser.read_raw) } }

    results
  end

  # Get a list of all the servers by ServerType. (Refer to sgm/mapping.cr#ServerType)
  # @return Array(Server)
  def self.servers_by_type(type : ServerType)
    servers = self.servers()

    servers.select { |s| s.server_type == type }
  end

end
