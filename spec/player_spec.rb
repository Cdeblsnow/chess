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
end
