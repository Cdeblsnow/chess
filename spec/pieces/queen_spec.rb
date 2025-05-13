require_relative "../../lib/piece/queen"

describe Queen do
  describe "#up" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return eight position from d1" do
      queen.up
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(7)
    end
  end

  describe "#down" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return zero position from d1" do
      queen.down
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#right" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return four position from d1" do
      queen.right
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(4)
    end
  end
end
