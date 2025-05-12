require_relative "../../lib/piece/king"

describe King do
  describe "#up_one" do
    subject(:king) { described_class.new("white", ["e", 1]) }

    it "return one position from e1" do
      king.up_one
      moves = king.instance_variable_get(:@moves)
      expect(moves.length).to eq(1)
    end
  end

  describe "#down_one" do
    subject(:king) { described_class.new("white", ["e", 1]) }

    it "return zero position from e1" do
      king.down_one
      moves = king.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#right_one" do
    subject(:king) { described_class.new("white", ["e", 1]) }

    it "return one position from e1" do
      king.right_one
      moves = king.instance_variable_get(:@moves)
      expect(moves.length).to eq(1)
    end
  end

  describe "#left_one" do
    subject(:king) { described_class.new("white", ["e", 1]) }

    it "return one position from e1" do
      king.left_one
      moves = king.instance_variable_get(:@moves)
      expect(moves.length).to eq(1)
    end
  end
end
