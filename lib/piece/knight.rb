class Knight
  attr_reader :value, :position

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265E}"
    when "white"
      @value = "\u{2658}"
    end
    @position = position
    @column_index = update_column_index
    @moves = []
  end

  def update_column_index
    @column_index = COLUMNS.index(@position[0])
  end

  def possible_moves
    @moves = []
    update_column_index
    case @value
    when "\u{265F}"
      moves << [@position[0], @position[1].to_i + 2] if @first_move == false
      moves << [@position[0], @position[1].to_i + 1]
    when "\u{2659}"
      moves << [@position[0], @position[1].to_i - 2] if @first_move == false
      moves << [@position[0], @position[1].to_i - 1]
    end
    moves
  end

  def up_left
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i + 2]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      # if the pice is from the same side stop

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
      # if the pice is from the other side add move and then stop
    end
  end

  def up_right
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 1], @position[1].to_i + 2]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def right_up
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 2], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def right_down
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 2], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def down_right
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 1], @position[1].to_i - 2]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def down_left
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i - 2]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def left_down
    1.times do # rubocop:disable Lint/UselessTimes
      break if @position[1].to_i + 1 > 8
      break if board[COLUMNS[@column_index - 2], @position[1].to_i - 1].side == @side

      @moves << [COLUMNS[@column_index - 2], @position[1].to_i - 1]
    end
  end

  def left_up
    1.times do # rubocop:disable Lint/UselessTimes
      break if @position[1].to_i + 1 > 8
      break if board[COLUMNS[@column_index - 2], @position[1].to_i + 1].side == @side

      @moves << [COLUMNS[@column_index - 2], @position[1].to_i + 1]
    end
  end

  def update_position(new_position)
    @position = new_position
    @first_move = true
  end
end
