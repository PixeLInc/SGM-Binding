require "http/client"
require "json"
require "./sgm/*"

module SGM
  # URL to server JSON
  SERVERS_URL = "https://www.seriousgmod.com/servers/json"

  # Sends a GET to SERVERS_URL and returns the json
  # @return String
  def self.get_servers
    HTTP::Client.get(SERVERS_URL).body
  end

  # Parse the json response to an Array(Server)
  # @param json : String | The json of the server listing
  # @param type : ServerType | The ServerType to get (refer to sgm/mapping.cr#ServerType)
  # @return Array(Server)
  def self.parse(json : String, type : ServerType = ServerType::Any)
    parser = JSON::PullParser.new(json)

    results = [] of Server
    parser.on_key("servers") { results = Array(Server).new(parser) }

    return results.select { |s| s.server_type == type } unless type == ServerType::Any

    results
  end

  # Get a list of servers
  # @param type : ServerType | Get servers by a ServerType (refer to sgm/mapping.cr#ServerType)
  # @return Array(Server)
  def self.servers(type : ServerType = ServerType::Any)
    servers_json = get_servers

    parse servers_json, type
  end

end

