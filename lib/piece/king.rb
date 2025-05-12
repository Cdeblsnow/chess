class King
  attr_reader :value, :position

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265A}"
    when "white"
      @value = "\u{2654}"
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
    update_column_index # add to others

    up_one
    down_one
    left_one
    right_one
    diagonal_left_one
    diagonal_right_one
    @moves
  end

  def up_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8

      position << [COLUMNS[@column_index], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      # if the pice is from the same side stop

      @moves << position.flatten
    end
  end

  def down_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1

      position << [COLUMNS[@column_index], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def right_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 1], @position[1].to_i]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def left_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def diagonal_right_up_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index + 1].nil?

      position << [COLUMNS[@column_index + 1], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def diagonal_left_up_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)

      @moves << position.flatten
    end
  end

  def update_position(new_position)
    @position = new_position
  end
end
