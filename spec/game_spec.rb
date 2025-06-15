require_relative "../lib/game"
require_relative "../lib/player"

describe Game do
  describe "#player_init" do
    subject(:game_players) { described_class.new }
    it "creates two players" do
      list = game_players.instance_variable_get(:@player_list)
      game_players.player_init
      expect(list.length).to eq(2)
    end
  end

  describe "#define_side" do
    subject(:game_side) { described_class.new }
    it "assign a side(black/white) to the the player" do
      game_side.player_init
      game_side.define_side
      player = game_side.instance_variable_get(:@player_list)[0]
      expect(player.show_player_side).to_not be(nil)
    end

    it "both players receive different sides" do
      game_side.player_init
      game_side.define_side
      player1 = game_side.instance_variable_get(:@player_list)[0]
      player2 = game_side.instance_variable_get(:@player_list)[1]
      expect(player1.show_player_side).to_not eq(player2.show_player_side)
    end
  end

  describe "#fill_player_pieces" do
    subject(:game_pieces) { described_class.new }
    it "fill player set after defining a side" do
      game_pieces.player_init
      game_pieces.define_side
      player1 = game_pieces.instance_variable_get(:@player_list)[0]
      expect(player1.piece_set.length).to eq(16)
    end
  end

  describe "#create_saves" do
    subject(:game_save) { described_class.new }
    it "creates the saving directory for the game" do
      game_save.create_saves
      expect(Dir.exist?("saved_games")).to eq(true)
    end

    it "creates the saving file for the game" do
      game_save.create_saves
      expect(File.exist?("saved_games/saves.json")).to eq(true)
    end
  end

  describe "#save_game" do
    subject(:game_save) { described_class.new }
    before do
      game_save.initialize_board
      game_save.player_init
      game_save.define_side
      players = game_save.player_list
      game_save.display(players)
      game_save.create_saves
      input = ""
      allow(input).to receive(:gets).and_return("save")
      game_save.save_game
    end

    it "The file saved is not empty" do
      content = File.read("saved_games/saves.json")
      expect(content.size).to be > 0
    end

    it "The saved file contains 'player_list' instance var" do
      content = File.read("saved_games/saves.json")
      expect(content).to include("player_list")
    end

    it "The saved file contains 'columns' instance var" do
      content = File.read("saved_games/saves.json")
      expect(content).to include("columns")
    end

    it "The saved file contains 'board_tiles' instance var" do
      content = File.read("saved_games/saves.json")
      expect(content).to include("board_tiles")
    end

    it "The saved file contains 'filled' instance var" do
      content = File.read("saved_games/saves.json")
      expect(content).to include("filled")
    end

    it "The saved file contains 'moves' instance var" do
      content = File.read("saved_games/saves.json")
      expect(content).to include("moves")
    end
  end
end
