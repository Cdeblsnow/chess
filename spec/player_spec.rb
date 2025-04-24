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

  describe "#create_king" do
    subject(:player_king) { described_class.new("test") }
    it "creates a king" do
      player_king.define_side("black")
      player_king.create_king
      piece_set = player_king.instance_variable_get(:@piece_set)
      expect(piece_set[0]).to be_a(King)
    end
  end

  describe "#create_queen" do
    subject(:player_queen) { described_class.new("test") }
    it "creates a queen" do
      player_queen.define_side("black")
      player_queen.create_queen
      piece_set = player_queen.instance_variable_get(:@piece_set)
      expect(piece_set[0]).to be_a(Queen)
    end
  end
end
