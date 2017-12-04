require "json"

module SGM
  struct Server
    JSON.mapping(
      ip: String,
      port: Int64,
      name_full: String,
      num_players: Int64,
      num_maxplayers: Int64,
      server_type: String,
      num_staff: {type: Int32, default: -1},
      map: {type: String, default: ""}
    )
  end
end
