require_relative "player"

class Game
  def initialize
    @player_list = []
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
  end
end
