require_relative "player"
require_relative "piece/pawn"
require_relative "board"
require "json"
require "fileutils"

class Game
  attr_reader :player_list

  include Board

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

  def match_end?(king, next_move)
    return true if king.position == next_move

    false
  end

  def create_saves # test
    FileUtils.mkdir_p("saved_games")
    File.write("saved_games/saves.json", "[]") unless File.exist?("saved_games/saves.jason")
  end

  def save_games
    File.open("saved_games/saves.jason", "w") do |file|
      file.write(JSON.pretty_generate(Players.to_json))
      file.write(JSON.pretty_generate(Game.to_json))
      file.write(JSON.pretty_generate(Board.to_json))
    end
  end
end
