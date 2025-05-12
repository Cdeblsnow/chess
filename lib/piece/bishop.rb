class Bishop
  attr_reader :value, :position

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265D}"
    when "white"
      @value = "\u{2657}"
    end
    @position = position
    @column_index = update_column_index
    @moves = []
  end

  def update_column_index
    @column_index = COLUMNS.index(@position[0])
  end

  def possible_moves(board)
    @moves = []
    update_column_index
    case @value
    when "\u{265D}"
      lef_downward_diagonal(board)
      right_downward_diagonal(board)
      lef_upward_diagonal(board)
      right_upward_diagonal(board)
    when "\u{2657}"
      lef_upward_diagonal(board)
      right_upward_diagonal(board)
      lef_downward_diagonal(board)
      right_downward_diagonal(board)
    end
    @moves
  end

  # add @board, maybe a module?, same with columns
  def right_upward_diagonal(board)
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i + i > 8
      break if COLUMNS[@column_index + i].nil?

      position << [COLUMNS[@column_index + i], @position[1].to_i + i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      # if the pice is from the same side stop

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
      # if the pice is from the other side add move and then stop
    end
  end

  def lef_upward_diagonal(board)
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i + i > 8
      break if COLUMNS[@column_index - i] == "h"

      position << [COLUMNS[@column_index - i], @position[1].to_i + i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      # if the pice is from the same side stop

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
      # if the pice is from the other side add move and then stop
    end
  end

  def right_downward_diagonal(board)
    (1..8).size.times do |i|
      break if @position[1].to_i + 1 < 1
      break if board[COLUMNS[@column_index + i], @position[1].to_i - 1].side == @side

      # if the pice is from the same side stop

      @moves << [COLUMNS[@column_index + i], @position[1].to_i - 1]
      break if board[COLUMNS[@column_index + i], @position[1].to_i - 1].value
      # if the pice is from the other side add move and then stop
    end
  end

  def lef_downward_diagonal(board)
    (1..8).size.times do |i|
      break if @position[1].to_i + 1 < 1
      break if board[COLUMNS[@column_index - i], @position[1].to_i - 1].side == @side

      # if the pice is from the same side stop

      @moves << [COLUMNS[@column_index - i], @position[1].to_i - 1]
      break if board[COLUMNS[@column_index - i], @position[1].to_i - 1].value
      # if the pice is from the other side add move and then stop
    end
  end

  def update_position(new_position)
    @position = new_position
  end

  # test everything and then git add
end
