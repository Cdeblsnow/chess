require_relative "piece/pawn"
class Player
  attr_reader :piece_set

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(name)
    @name = name
    @points = 0
    @side = "" # make aleatory pick white/black
    @piece_set = []
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

  def receive_set(set)
    @piece_set << set
  end

  def create_pawn
    8.times { |i| @piece_set << (Pawn.new(@side, [COLUMNS[i], 1])) }
  end
end
