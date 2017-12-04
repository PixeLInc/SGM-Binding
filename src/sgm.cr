require "http/client"
require "json"
require "./sgm/*"

module SGM

  SERVERS_URL = "https://www.seriousgmod.com/servers/json"

  def self.servers
    resp = HTTP::Client.get SERVERS_URL
    parser = JSON::PullParser.new(resp.body)

    results = [] of Server

    parser.read_object do |key|
      case key
        when "servers"
          parser.read_array { results << Server.from_json(parser.read_raw) }
        else
          parser.skip
      end
    end

    results
  end

end

p SGM.servers
