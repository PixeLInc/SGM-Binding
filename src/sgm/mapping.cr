require "json"

module SGM
  # Server Object
  struct Server
    JSON.mapping(
      ip: String,
      port: Int64,
      name_full: String,
      num_players: Int64,
      num_maxplayers: Int64,
      server_type: {type: ServerType, converter: ServerParser},
      num_staff: {type: Int32, default: -1},
      map: {type: String, default: ""}
    )
  end

  # The possible server types
  enum ServerType
    Deathrun
    Terrortown
    Teamspeak3
    Any
  end

  # Parse to ServerType and back to JSON
  module ServerParser
    def self.from_json(parser)
      ServerType.parse parser.read_string
    end
  end

end
