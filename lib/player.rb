require_relative "piece/pawn"
require_relative "piece/king"
require_relative "piece/bishop"
require_relative "piece/knight"
require_relative "piece/queen"
require_relative "piece/rook"
class Player
  attr_reader :piece_set, :name, :side

  COLUMNS = %w[a b c d e f g h].freeze
  def initialize(name)
    @name = name
    @points = 0
    @side = "" # make aleatory pick white/black
    @piece_set = []
  end

  def deliver_king
    @piece_set[0]
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

  def show_player_set
    @piece_set
  end

  def receive_set(set)
    @piece_set << set
  end

  def create_pawns
    if @side == "black"
      8.times { |i| @piece_set << (Pawn.new(@side, [COLUMNS[i], 7])) }
    else
      8.times { |i| @piece_set << (Pawn.new(@side, [COLUMNS[i], 2])) }
    end
  end

  def create_king
    @piece_set << if @side == "black"
                    King.new(@side, ["e", 8])
                  else
                    King.new(@side, ["e", 1])
                  end
  end

  def create_queen
    @piece_set << if @side == "black"
                    Queen.new(@side, ["d", 8])
                  else
                    Queen.new(@side, ["d", 1])
                  end
  end

  def create_bishops
    if @side == "black"
      @piece_set << (Bishop.new(@side, ["c", 8]))
      @piece_set << (Bishop.new(@side, ["f", 8]))
    else
      @piece_set << (Bishop.new(@side, ["c", 1]))
      @piece_set << (Bishop.new(@side, ["f", 1]))
    end
  end

  def create_knights
    if @side == "black"
      @piece_set << (Knight.new(@side, ["b", 8]))
      @piece_set << (Knight.new(@side, ["g", 8]))
    else
      @piece_set << (Knight.new(@side, ["b", 1]))
      @piece_set << (Knight.new(@side, ["g", 1]))
    end
  end

  def create_rooks
    if @side == "black"
      @piece_set << (Rook.new(@side, ["a", 8]))
      @piece_set << (Rook.new(@side, ["h", 8]))
    else
      @piece_set << (Rook.new(@side, ["a", 1]))
      @piece_set << (Rook.new(@side, ["h", 1]))
    end
  end

  def fill_set
    create_king
    create_queen
    create_rooks
    create_bishops
    create_knights
    create_pawns
  end
end
