require_relative "../lib/board"
require_relative "../lib/game"

describe Board do
  describe "#piece_move" do
    subject(:board_move) { described_class.new }
    let(:game_fill) { Game.new }
    before do
      game_fill.player_init
      game_fill.define_side
    end

    it "moves a pawn one space" do # do the expect
      board_move.display(game_fill.player_list)
      board_move.present_move_choices("a2")
      board_move.select_piece_to(1, "a2")
      board_move.instance_variable_get(:@moves)
      board_move.piece_move(1, "a2")
      board_move.display(game_fill.player_list)
    end
  end
end
