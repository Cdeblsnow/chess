module Board
  def initialize_board
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

  def redisplay(list)
    puts "\e[2J\e[H"
    display(list)
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

  def valid_piece?(player, position)
    piece = @board_tiles[position[0]][position[1].to_i]
    return false if piece.is_a?(Array)

    player.side == piece.side
  end

  # I have to grap the choice, from moves
  def present_move_choices(position)
    @moves = []
    piece = @board_tiles[position[0]][position[1].to_i]
    @moves << "These are your #{piece.class} possible movements: "
    move_set = refine_moves(piece, piece.possible_moves)
    if move_set.length.positive?
      move_set.each_with_index do |m, i|
        @moves << ["#{i + 1}:", m.to_s]
      end
      puts @moves.join(" ")
    else
      0
    end
  end

  # from input to player move
  def select_piece_to(player_move, input)
    piece = @board_tiles[input[0]][input[1].to_i]
    moves = piece.possible_moves
    piece_move(player_move, input)
    puts "#{piece.value} moves to => #{moves[player_move - 1]}"
    piece.position
  end

  # remove moves that collide with pieces from the same side
  def refine_moves(piece, moves)
    moves_grouped = group_array(moves)
    new_moves = []
    restringed_rows = []
    moves_grouped.each do |column|
      column.each do |move|
        tile = @board_tiles[move[0]][move[1]]
        if tile.is_a?(Array)
          # avoid adding the diagonals as possible moves for pawns when opposite side piece is not present
          pawn_with_no_diagonal_enemies = piece.is_a?(Pawn) && move[0] != piece.position[0]
          row_blocked = restringed_rows.include?(move[1])

          new_moves << move unless pawn_with_no_diagonal_enemies || row_blocked

        elsif tile.side != piece.side

          new_moves << move
          restringed_rows << move[1]
          break
        else
          break if piece.position[0] == move[0]

          restringed_rows << move[1]
          # the first line seeks pieces of the same side vertically
          # the second line does the same horizontally

          next
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

  # check everything below here
  def check?(king)
    grouped_moves = group_array(king.possible_check_pos)
    switch = false
    threats = threat_tiles(grouped_moves, king) # get the antagonistic pieces in all direction
    threats.each do |tile|
      set = refine_moves(tile, tile.possible_moves) # check is said pieces can reach the king in one move
      switch = true if set.any?(king.position)
      break if switch == true
    end
    switch
  end

  def mate?(king, enemy_pieces)
    king_range = group_array(king.possible_moves)
    switch = my_method(remove_allies(king_range), enemy_pieces)
    switch[0]
  end

  def my_method(king_range, enemy_pieces)
    switch = [false, 0]
    enemy_pieces.each do |piece|
      next if piece.is_a?(King)

      set = refine_moves(piece, piece.possible_moves)
      king_range.each do |position|
        switch[0] = false
        next unless set.any?(position)

        switch[0] = true
        switch[1] += 1
        break
      end
      break if switch[1] >= 2
    end
    switch
  end

  def remove_allies(king_range)
    viable_moves = []
    king_range.each do |column|
      column.each do |move|
        tile = @board_tiles[move[0]][move[1]]

        viable_moves << move if tile.is_a?(Array)
      end
    end
    viable_moves
  end

  def threat_tiles(grouped_moves, king)
    possible_dangers = []
    grouped_moves.each do |column|
      column.each do |move|
        tile = @board_tiles[move[0]][move[1]]
        next if tile.is_a?(Array)
        next unless tile.side != king.side

        possible_dangers << tile
        # only adds antagonistic pieces
      end
    end
    possible_dangers
  end
end
