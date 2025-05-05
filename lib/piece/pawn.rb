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
    @original_position = position
    @first_move = false
  end

  def possible_moves
    moves = [] # check for the methods that use possible movements and remove to_i
    p @position
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

  def update_position(new_position)
    @position = new_position
    puts @position
    @first_move = true
  end
end
