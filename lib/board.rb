class Board
  def initialize
    @board_tiles = ("a".."h").to_h { |i| [i, Array.new(9) { [] }] }
    @has_been_filled = false
    @moves = []
  end

  def display(list)
    fill_board_tiles(list) if @has_been_filled == false
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
    @has_been_filled = true
  end

  def present_move_choices(position) # I have to grap the choice, from moves
    @moves = []
    @moves << "For your selected pice these are your possible movements: "
    piece = @board_tiles[position[0]][position[1].to_i]
    move_set = refine_moves(piece, piece.possible_moves)
    move_set.each_with_index do |m, i|
      @moves << ["#{i + 1}:", "#{m}"]
    end
    puts @moves.join(" ")
  end

  # from input to player move
  def select_piece_to(player_move, input)
    piece = @board_tiles[input[0]][input[1].to_i]
    moves = piece.possible_moves
    piece_move(player_move, input)
    puts "#{piece.value} moves to => #{moves[player_move - 1]}"
  end

  # remove moves that collide with pieces from the same side
  def refine_moves(piece, moves)
    moves_grouped = group_array(moves)
    new_moves = []
    moves_grouped.each do |column|
      column.each do |move|
        tile = @board_tiles[move[0]][move[1]]
        if tile.is_a?(Array)

          new_moves << move
        elsif tile.side != piece.side # rubocop:disable Lint/DuplicateBranch

          new_moves << move
        else
          break
        end
      end
    end
    new_moves
  end

  def group_array(moves)
    new = moves.group_by { |column| column[0] }
    new.values
  end

  def piece_move(player_move, input)
    column = @moves[player_move][1][2] # change only the first number to iterate over the array
    row = @moves[player_move][1][6].to_i
    piece_update(@board_tiles[input[0]][input[1].to_i], column, row)
    tiles_update(@board_tiles[input[0]][input[1].to_i], column, row)
    @board_tiles[input[0]][input[1].to_i] = []
  end

  def piece_update(piece, column, row)
    piece.update_position([column, row])
  end

  def tiles_update(tile, column, row)
    @board_tiles[column][row] = tile
  end
end
