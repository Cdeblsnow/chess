require_relative "../lib/piece/pawn"
require_relative "../lib/board"

describe Pawn do
  describe "#possible_moves" do
    subject(:pawn_move) { described_class.new("white", "a2") }

    it "Delivered two possible movements as the first movement" do
      expect(pawn_move.possible_moves.length).to eq(2)
    end

    it "Delivered one possible movement after the first movement is true" do
      pawn_move.possible_moves
      pawn_move.instance_variable_set(:@first_move, true)
      expect(pawn_move.possible_moves.length).to eq(1)
    end
  end
end
