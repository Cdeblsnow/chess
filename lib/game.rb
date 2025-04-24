require_relative "player"
require_relative "piece/pawn"

class Game
  attr_accessor :player_list

  def initialize
    @player_list = []
    @columns = %w[a b c d e f g h]
  end

  def player_init
    (1..2).each do |i|
      puts "Please add player#{i} name"
      player_name = gets.chomp
      @player_list << Player.new(player_name)
    end
  end

  def define_side
    first = @player_list.sample
    first.define_side("white")
    @player_list.each do |player|
      second = player unless player == first
      second&.define_side("black") # &. safe navigator
    end
    fill_player_pieces
  end

  def fill_player_pieces
    @player_list.each(&:fill_set)
  end
end
