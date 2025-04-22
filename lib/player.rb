class Player
  def initialize(name)
    @name = name
    @points = 0
    @side = "" # make aleatory pick white/black
  end

  def add_point
    @points += 1
  end
end
