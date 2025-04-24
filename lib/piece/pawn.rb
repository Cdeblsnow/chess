class Pawn
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265F}"
    when "white"
      @value = "\u{2659}"
    end
    @position = [position]
  end

  def valid_move(move)
  end
end
