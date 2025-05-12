require_relative "../../lib/piece/bishop"

describe Bishop do # rubocop:disable Metrics/BlockLength
  describe "#right_upward_diagonal" do
    subject(:bishop) { described_class.new("white", ["c", 1]) }
    before do
      bishop.update_column_index
    end

    it "return five positions from c1" do
      bishop.right_upward_diagonal
      moves = bishop.instance_variable_get(:@moves)

      expect(moves.length).to eq(5)
    end
  end

  describe "#lef_upward_diagonal" do
    subject(:bishop) { described_class.new("white", ["c", 1]) }
    before do
      bishop.update_column_index
    end

    it "return two positions from c1" do
      bishop.lef_upward_diagonal
      moves = bishop.instance_variable_get(:@moves)

      expect(moves.length).to eq(2)
    end
  end

  describe "#lef_downward_diagonal" do
    subject(:bishop) { described_class.new("white", ["c", 1]) }
    before do
      bishop.update_column_index
    end

    it "return zero positions from c1" do
      bishop.lef_downward_diagonal
      moves = bishop.instance_variable_get(:@moves)

      expect(moves.length).to eq(0)
    end

    it "return two positions from d3" do
      bishop.update_position(["d", 3])
      bishop.lef_downward_diagonal
      moves = bishop.instance_variable_get(:@moves)
      expect(moves.length).to eq(2)
    end
  end

  describe "#right_downward_diagonal" do
    subject(:bishop) { described_class.new("white", ["c", 1]) }
    before do
      bishop.update_column_index
    end

    it "return zero positions from c1" do
      bishop.right_downward_diagonal
      moves = bishop.instance_variable_get(:@moves)

      expect(moves.length).to eq(0)
    end

    it "return two positions from d3" do
      bishop.update_position(["d", 3])
      bishop.right_downward_diagonal
      moves = bishop.instance_variable_get(:@moves)
      expect(moves.length).to eq(2)
    end
  end

  describe "#possible_moves" do
    subject(:bishop) { described_class.new("white", ["c", 1]) }
    before do
      bishop.update_column_index
    end

    it "return seven positions from c1" do
      bishop.possible_moves
      moves = bishop.instance_variable_get(:@moves)

      expect(moves.length).to eq(7)
    end
  end
end
