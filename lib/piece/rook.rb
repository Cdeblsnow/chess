class Rook
  attr_reader :value, :side, :position

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265C}"
      @side = "black"
    when "white"
      @value = "\u{2656}"
      @side = "white"
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
    up
    down
    left
    right
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

  def update_position(new_position)
    @position = new_position
    update_column_index
  end
end
