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

  describe "#left" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return three position from d1" do
      queen.left
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(3)
    end
  end

  describe "#diagonal_right_up_one" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return four position from d1" do
      queen.diagonal_right_up
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(4)
    end
  end

  describe "#diagonal_left_up_one" do
    subject(:queen) { described_class.new("white", ["d", 1]) }

    it "return three position from d1" do
      queen.diagonal_left_up
      moves = queen.instance_variable_get(:@moves)
      expect(moves.length).to eq(3)
    end
  end
end
