class Rook
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265C}"
    when "white"
      @value = "\u{2656}"
    end
    @position = [position]
  end
end
