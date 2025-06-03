module Movement
  COLUMNS = %w[a b c d e f g h].freeze

  def possible_check_pos
    @moves = []

    up
    down
    left
    right
    diagonal_left_up
    diagonal_right_up
    diagonal_left_down
    diagonal_right_down
    @moves
  end

  def up
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i + i > 8

      position << [COLUMNS[@column_index], @position[1].to_i + i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      # if the pice is from the same side stop

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
      # if the pice is from the other side add move and then stop
    end
  end

  def down
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i - i < 1

      position << [COLUMNS[@column_index], @position[1].to_i - i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def right
    (1..8).size.times do |i|
      position = []
      break if COLUMNS[@column_index + i].nil?

      position << [COLUMNS[@column_index + i], @position[1].to_i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def left
    (1..8).size.times do |i|
      position = []
      break if COLUMNS[@column_index - i] == "h"

      position << [COLUMNS[@column_index - i], @position[1].to_i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def diagonal_right_up
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

  def diagonal_left_up
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i + i > 8
      break if COLUMNS[@column_index - i] == "h"

      position << [COLUMNS[@column_index - i], @position[1].to_i + i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def diagonal_right_down
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i - i < 1
      break if COLUMNS[@column_index + i].nil?

      position << [COLUMNS[@column_index + i], @position[1].to_i - i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end

  def diagonal_left_down
    (1..8).size.times do |i|
      position = []
      break if @position[1].to_i - i < 1
      break if COLUMNS[@column_index - i] == "h"

      position << [COLUMNS[@column_index - i], @position[1].to_i - i]
      break if !position.is_a?(Array) && (position&.side == @side)
      next if @position == position.flatten

      @moves << position.flatten
      break if !position.is_a?(Array) && position&.value
    end
  end
end
