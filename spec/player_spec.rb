require_relative "../lib/player"

describe Player do
  describe "#add_point" do
    subject(:player_point) { described_class.new("test") }
    it "increases player points by 1" do
      player_point.add_point
      points = player_point.instance_variable_get(:@points)
      expect(points).to eq(1)
    end
  end

  describe "#create_pawn" do
    subject(:player_pawn) { described_class.new("test") }
    it "creates eight pawns" do
      player_pawn.define_side("black")
      player_pawn.create_pawn
      piece_set = player_pawn.instance_variable_get(:@piece_set)
      8.times { |i| expect(piece_set[i]).to be_a(Pawn) }
    end
  end
end
