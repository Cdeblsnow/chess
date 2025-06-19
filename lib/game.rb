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
      player_name = "Player#{i}" if player_name == ""
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

  def create_saves
    FileUtils.mkdir_p("saved_games")
    File.write("saved_games/saves.json", "[]") unless File.exist?("saved_games/saves.json")
  end

  def save_game(player1, player2)
    my_data = JSON.parse(File.read("saved_games/saves.json"))
    match = {
      name: save_name,
      player1: player1,
      player2: player2
    }
    my_data << match
    File.write("saved_games/saves.json", JSON.pretty_generate(my_data))
  end

  def save_name
    puts "Add a name for this save or press enter"
    name = gets.chomp
    name = Time.now.strftime("%d/%m/%Y %H:%M") if name == ""
    name
  end

  def to_json(name)
    # do not use dump with pretty generate
    {
      save_name: name
    }
  end

  def load_game(data)
    data.each do |info, value|
      next if info == "name"

      current = Player.new(value["name"])
      current.define_side(value["side"])
      current.re_fill_set(value["piece_set"])
      @player_list << current
    end
  end
end
