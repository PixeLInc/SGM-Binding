require "./spec_helper"

describe "parse to server array" do
  it "parses to an Array(Server)" do
    json = servers_json

    faked_arr = [
      SGM::Server.from_json(%({"ip": "test", "port": 2034, "name_full": "ree", "num_players": 66, "num_maxplayers": 3444, "server_type": "terrortown", "num_staff": 100, "map": "urmom"})),
      SGM::Server.from_json(%({"ip": "aklsdm", "port": 666, "name_full": "rawrxdnuzzle", "num_players": 0, "num_maxplayers": 1, "server_type": "deathrun", "num_staff": 0, "map": "hah"}))
    ]

    results = SGM.parse json

    results.should eq faked_arr
  end
end
