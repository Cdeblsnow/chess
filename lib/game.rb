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
end
