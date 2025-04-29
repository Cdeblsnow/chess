class Board
  def initialize
    @board_tiles = ("a".."h").to_h { |i| [i, Array.new(9) { [] }] }
  end

  def display(list)
    fill_board_tiles(list)
    current = tiles
    puts " \n\n#{current}"
    puts "  a     b      c     d     e     f     g     h\n\n"
  end

  def tiles
    position = +""
    8.downto(1) do |index|
      position << index.to_s

      @board_tiles.each_value do |value|
        piece = value[index].to_s unless value[index].empty?
        position << " \u{1FB7D} #{piece || ' '} \u{1FB7E}"
      end
      position << "\n"

      position << " "
      @board_tiles.each_value do
        position << " \u{1FB7C}   \u{1FB7F}"
      end
      position << "\n"
    end
    position
  end

  def fill_board_tiles(player_list)
    player_list.each do |player|
      set = player.piece_set
      set.each do |piece|
        puts piece.value
        @board_tiles[piece.position[0]][piece.position[1]] = piece.value
      end
    end
  end
end
