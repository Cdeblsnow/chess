require_relative "../../lib/piece/knight"

describe Knight do
  describe "#up_left" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "returns a3 position from b1" do
      knight.up_left
      moves = knight.instance_variable_get(:@moves)
      p moves
      expect(moves.flatten).to eq(["a", 3])
    end
  end

  describe "#up_right" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "returns c3 position from b1" do
      knight.up_right
      moves = knight.instance_variable_get(:@moves)
      p moves
      expect(moves.flatten).to eq(["c", 3])
    end
  end
end
