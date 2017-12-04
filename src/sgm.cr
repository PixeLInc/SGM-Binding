require "http/client"
require "json"
require "./sgm/*"

module SGM
  # URL to server JSON
  SERVERS_URL = "https://www.seriousgmod.com/servers/json"

  # Get a list of servers
  # @param type : ServerType | Get servers by a ServerType (refer to sgm/mapping.cr#ServerType)
  # @return Array(Server)
  def self.servers(type : ServerType = ServerType::Any)
    resp = HTTP::Client.get SERVERS_URL
    parser = JSON::PullParser.new(resp.body)

    results = [] of Server

    parser.on_key("servers") { parser.read_array { results << Server.from_json(parser.read_raw) } }

    return results.select { |s| s.server_type == type } unless type == ServerType::Any

    results
  end

end

