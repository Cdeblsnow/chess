class Pawn
  attr_reader :value, :position

  COLUMNS = %w[a b c d e f g h].freeze

  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265F}"
    when "white"
      @value = "\u{2659}"
    end
    @position = position
    @first_move = false
    @moves = []
  end

  def update_column_index
    @column_index = COLUMNS.index(@position[0])
  end

  def possible_moves
    @moves = []
    case @value
    when "\u{265F}"
      @moves << [COLUMNS[@column_index], @position[1].to_i + 2]
    when "\u{2659}"
      @moves << [COLUMNS[@column_index].to_i - 2]
    end
    @moves
  end

  def w_move_by_two
    @moves << [COLUMNS[@column_index], @position[1].to_i + 2]
  end

  def w_move_by_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8

      position << [COLUMNS[@column_index], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def w_right_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8

      position << [COLUMNS[@column_index + 1], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten if !position.is_a?(Array) && (position&.side != @side)
    end
  end

  def w_left_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten if !position.is_a?(Array) && (position&.side != @side)
    end
  end

  def b_move_by_two
    @moves << [COLUMNS[@column_index], @position[1].to_i - 2]
  end

  def b_move_by_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1

      position << [COLUMNS[@column_index], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def b_right_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1

      position << [COLUMNS[@column_index + 1], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten if !position.is_a?(Array) && (position&.side != @side)
    end
  end

  def b_left_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten if !position.is_a?(Array) && (position&.side != @side)
    end
  end

  def update_position(new_position)
    @position = new_position
    @first_move = true
    update_column_index
  end

  # update pawn to avoid claashing with pices of the same color and to stop in front of pieces of other color
end
