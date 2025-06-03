require_relative "movement"

class Queen
  attr_reader :value, :side, :position

  include Movement

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(side, position)
    case side
    when "white"
      @value = "\u{265B}"
      @side = "white"
    when "black"
      @value = "\u{2655}"
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

  def update_position(new_position)
    @position = new_position
    update_column_index
  end
end
