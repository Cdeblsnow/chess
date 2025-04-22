class Board
  def initialize
    @board_tiles = (1..8).to_h { |i| [i, Array.new(8) { [] }] }
  end

  def display
    current = tiles
    puts " \n\n#{current}"
    puts "  1   2    3   4   5   6   7   8\n\n"
  end

  def tiles
    position = +""

    8.times do |index|
      position << "#{index + 1}"

      @board_tiles.each_value do
        position << " \u{1FB7D} \u{1FB7E}"
      end
      position << "\n"
      position << " "
      @board_tiles.each_value do
        position << " \u{1FB7C} \u{1FB7F}"
      end
      position << "\n"
    end
    position
  end
end
