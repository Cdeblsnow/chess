class Knight
  attr_reader :value, :side, :position

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "white"
      @value = "\u{265E}"
      @side = "white"
    when "black"
      @value = "\u{2658}"
      @side = "black"
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
    up_left
    up_right
    right_up
    right_down
    down_right
    down_left
    left_down
    left_up
    @moves
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
      break if COLUMNS[@column_index + 2].nil?

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
      break if COLUMNS[@column_index + 2].nil?

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
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index - 2] == "h"

      position << [COLUMNS[@column_index - 2], @position[1].to_i - 1]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def left_up
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index - 2] == "h"

      position << [COLUMNS[@column_index - 2], @position[1].to_i + 1]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def update_position(new_position)
    @position = new_position
    update_column_index
  end

  def to_h
    { Knight: [@side, @position] }
  end
end
