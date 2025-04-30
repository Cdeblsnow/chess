class Pawn
  attr_reader :value, :position

  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265F}"
    when "white"
      @value = "\u{2659}"
    end
    @position = position
    @first_move = false
  end

  def possible_moves
    moves = []
    case @value
    when "\u{265F}"
      if @first_move == false
        moves << [@position[0], @position[1] + 2]
        @first_move == true
      end
      moves << [@position[0], @position[1] + 1]
    when "\u{2659}"
      if @first_move == false
        moves << [@position[0], @position[1] - 2]
        @first_move == true
      end
      moves << [@position[0], @position[1] - 1]
    end
    moves
  end
end
