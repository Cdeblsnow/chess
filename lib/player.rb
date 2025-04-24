require_relative "piece/pawn"
require_relative "piece/king"
require_relative "piece/bishop"
require_relative "piece/knight"
require_relative "piece/queen"
require_relative "piece/rook"
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

  def create_king
    @piece_set << (King.new(@side, ["e", 1]))
  end
end
