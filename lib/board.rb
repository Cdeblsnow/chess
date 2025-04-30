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
        piece = value[index] unless value[index].is_a?(Array)
        position << " \u{1FB7D} #{piece&.value || ' '} \u{1FB7E}"
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
        @board_tiles[piece.position[0]][piece.position[1]] = piece
      end
    end
  end

  def select_piece_to(player_move, input)
    piece = @board_tiles[input[0]][input[1].to_i]
    # Piece moves to =>
    p piece.possible_moves[player_move - 1]
  end

  def present_move_choices(position)
    moves = +""
    moves << "For your selected pice these are your possible movements: "
    piece = @board_tiles[position[0]][position[1].to_i]
    piece.possible_moves.each_with_index do |m, i|
      moves << "#{i + 1}:#{m} "
    end
    puts moves
  end
end
