class King
  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265A}"
    when "white"
      @value = "\u{2654}"
    end
    @position = [position]
  end
end
