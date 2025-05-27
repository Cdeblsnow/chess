class Pawn
  attr_reader :value, :side, :position, :first_move

  COLUMNS = %w[a b c d e f g h].freeze

  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265F}"
      @side = "black"
    when "white"
      @value = "\u{2659}"
      @side = "white"
    end
    @position = position
    @first_move = false
    @moves = []
    update_column_index
  end

  def update_column_index
    @column_index = COLUMNS.index(@position[0])
  end

  def possible_moves
    @moves = []
    case @value
    when "\u{265F}"
      w_move_by_two
      w_move_by_one
      w_left_diagonal
      w_right_diagonal
    when "\u{2659}"
      b_move_by_two
      b_move_by_one
      b_left_diagonal
      b_right_diagonal

    end
    @moves
  end

  def w_move_by_two
    @moves << [COLUMNS[@column_index], @position[1].to_i + 2] if @first_move == false
  end

  def w_move_by_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8

      position << [COLUMNS[@column_index], @position[1].to_i + 1]

      @moves << position.flatten
    end
  end

  def w_right_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8

      position << [COLUMNS[@column_index + 1], @position[1].to_i + 1]

      @moves << position.flatten
    end
  end

  def w_left_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i + 1 > 8
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i + 1]

      @moves << position.flatten
    end
  end

  def b_move_by_two
    @moves << [COLUMNS[@column_index], @position[1].to_i - 2] if @first_move == false
  end

  def b_move_by_one
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1

      position << [COLUMNS[@column_index], @position[1].to_i - 1]

      @moves << position.flatten
    end
  end

  def b_right_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1

      position << [COLUMNS[@column_index + 1], @position[1].to_i - 1]

      @moves << position.flatten
    end
  end

  def b_left_diagonal
    1.times do # rubocop:disable Lint/UselessTimes
      position = []
      break if @position[1].to_i - 1 < 1
      break if COLUMNS[@column_index - 1] == "h"

      position << [COLUMNS[@column_index - 1], @position[1].to_i - 1]

      @moves << position.flatten
    end
  end

  def update_position(new_position)
    @position = new_position
    @first_move = true
    update_column_index
  end

  # update pawn to avoid claashing with pices of the same color and to stop in front of pieces of other color
end
