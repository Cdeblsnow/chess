require_relative "../../lib/piece/knight"

describe Knight do
  describe "#up_left" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "returns a3 position from b1" do
      knight.up_left
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["a", 3])
    end
  end

  describe "#up_right" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "returns c3 position from b1" do
      knight.up_right
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["c", 3])
    end
  end

  describe "#right_up" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "returns c3 position from b1" do
      knight.right_up
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["d", 2])
    end
  end

  describe "#right_down" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "do not returns position from b1" do
      knight.right_down
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#down_right" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "do not returns position from b1" do
      knight.down_right
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#down_left" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "do not returns position from b1" do
      knight.down_left
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#left_down" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "do not returns position from b1" do
      knight.left_down
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#left_up" do
    subject(:knight) { described_class.new("white", ["b", 1]) }

    it "do not returns position from b1" do
      knight.left_up
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#up_left" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns no positions" do
      knight.up_left
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#up_right" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns no positions" do
      knight.up_right
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#right_up" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns no positions" do
      knight.right_up
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#right_down" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns no positions" do
      knight.right_down
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end

  describe "#down_right" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns h6 from g8" do
      knight.down_right
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["h", 6])
    end
  end

  describe "#down_left" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns f6 from g8" do
      knight.down_left
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["f", 6])
    end
  end

  describe "#left_down" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "returns e7from g8" do
      knight.left_down
      moves = knight.instance_variable_get(:@moves)
      expect(moves.flatten).to eq(["e", 7])
    end
  end

  describe "#left_up" do
    subject(:knight) { described_class.new("black", ["g", 8]) }

    it "do not returns position from b1" do
      knight.left_up
      moves = knight.instance_variable_get(:@moves)
      expect(moves.length).to eq(0)
    end
  end
end
