class Queen
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265B}"
    when "white"
      @value = "\u{2655}"
    end
    @position = [position]
  end
end
