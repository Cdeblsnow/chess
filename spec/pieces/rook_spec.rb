require_relative "../../lib/piece/rook"

describe Rook do
  describe "#up" do
    subject(:rook) { described_class.new("white", ["a", 1]) }

    it "returns seven positions from a1" do
      rook.up
      moves = rook.instance_variable_get(:@moves)
      expect(moves.length).to eq(7)
    end
  end

  describe "#down" do
    subject(:rook) { described_class.new("white", ["a", 1]) }

    it "returns zero positions from a1" do
      rook.down
      moves = rook.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end
end
