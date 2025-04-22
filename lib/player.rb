class Player
  def initialize(name)
    @name = name
    @points = 0
    @side = "" # make aleatory pick white/black
  end

  def add_point
    @points += 1
  end

  def define_side(side)
    @side = side
  end

  def show_player_side
    @side
  end
end
