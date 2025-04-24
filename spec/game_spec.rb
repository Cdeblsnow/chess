require_relative "../lib/game"
require_relative "../lib/player"

describe Game do
  describe "player_init" do
    subject(:game_players) { described_class.new }
    it "creates two players" do
      list = game_players.instance_variable_get(:@player_list)
      game_players.player_init
      expect(list.length).to eq(2)
    end
  end
end
