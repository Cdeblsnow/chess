class Knight
  attr_reader :value, :position

  def initialize(side, position)
    case side
    when "black"
      @value = "\u{265E}"
    when "white"
      @value = "\u{2658}"
    end
    @position = position
  end
end
