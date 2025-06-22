require_relative "../lib/player"

describe Player do
  describe "#create_pawns" do
    subject(:player_pawn) { described_class.new("test") }
    it "creates eight pawns" do
      player_pawn.define_side("black")
      player_pawn.create_pawns
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

  describe "#create_bishops" do
    subject(:player_bishops) { described_class.new("test") }
    it "creates two bishops" do
      player_bishops.define_side("black")
      player_bishops.create_bishops
      piece_set = player_bishops.instance_variable_get(:@piece_set)
      piece_set.each { |piece| expect(piece).to be_a(Bishop) }
    end
  end

  describe "#create_knights" do
    subject(:player_knights) { described_class.new("test") }
    it "creates two knights" do
      player_knights.define_side("black")
      player_knights.create_knights
      piece_set = player_knights.instance_variable_get(:@piece_set)
      piece_set.each { |piece| expect(piece).to be_a(Knight) }
    end
  end

  describe "#create_rooks" do
    subject(:player_rooks) { described_class.new("test") }
    it "creates two rooks" do
      player_rooks.define_side("black")
      player_rooks.create_rooks
      piece_set = player_rooks.instance_variable_get(:@piece_set)
      piece_set.each { |piece| expect(piece).to be_a(Rook) }
    end
  end
end
