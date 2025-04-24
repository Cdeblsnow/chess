class Bishop
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265D}"
    when "white"
      @value = "\u{2657}"
    end
    @position = [position]
  end
end
