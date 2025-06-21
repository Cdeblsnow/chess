require_relative "lib/game"

options = {

  "1" => "New game",
  "2" => "Load game",
  "3" => "Quit"
}

game = Game.new

puts "Welcome, please select one of the following options"
options.each { |key, value| puts "#{key}. #{value}" }
choice = gets.chomp

case choice

when "1"
  puts "\e[2J\e[H"
  game.initialize_board
  game.player_init
  game.define_side
  players = game.player_list
  game.create_saves
  save = false
  game.redisplay(players)
  i = 0
  loop do
    current_player = players[i % players.length] # loop trough every player
    opposite_player = players[(i + 1) % players.length]
    puts <<~HEREDOC
      It is #{current_player.name} turn, please select a #{current_player.side} piece!

      Please select the piece piece you want to move! (Column,row).

      You can save at any time by writing 'save.'
    HEREDOC

    puts " #{current_player.name} is in check" if game.check?(current_player.deliver_king)
    puts " #{current_player.name} is in mate" if game.mate?(current_player.deliver_king, opposite_player.piece_set)
    input = ""

    loop do
      input = gets.chomp
      if input == "save"
        game.save_game(current_player.to_json, opposite_player.to_json)
        save = true
        break
      end
      break if game.valid_piece?(current_player, input.chars)

      puts "Please select a valid piece"
    end

    break if save == true

    if game.present_move_choices(input)&.zero?
      puts "Please select another pice"
      input = gets.chomp.chars
    end

    game.save_game && break if input == "save"

    player_move = gets.chomp.to_i

    if game.match_end?(opposite_player.deliver_king, game.select_piece_to(player_move, input))
      puts "congratulations, #{current_player} wins!"
      break
    end

    game.redisplay(players)
    i += 1
  end

when "2"
  puts "\e[2J\e[H"
  my_save = JSON.parse(File.read("saved_games/saves.json"))
  my_save.each_with_index do |saved_game, index|
    puts "#{index + 1}. #{saved_game['name']}"
  end
  selection = ""
  loop do
    selection = gets.chomp
    break if selection =~ /\A-?\d+\z/

    puts "Enter a valid input"
  end
  game.load_game(my_save[selection.to_i - 1])
  game.initialize_board
  players = game.player_list
  puts "\e[2J\e[H"
  game.create_saves
  save = false
  game.redisplay(players)
  i = 0
  loop do
    current_player = players[i % players.length] # loop trough every player
    opposite_player = players[(i + 1) % players.length]
    puts <<~HEREDOC
      It is #{current_player.name} turn, please select a #{current_player.side} piece!

      Please select the piece piece you want to move! (Column,row).

      You can save at any time by writing 'save.'
    HEREDOC

    puts " #{current_player.name} is in check" if game.check?(current_player.deliver_king)
    puts " #{current_player.name} is in mate" if game.mate?(current_player.deliver_king, opposite_player.piece_set)
    input = ""

    loop do
      input = gets.chomp
      if input == "save"
        game.save_game(current_player.to_json, opposite_player.to_json)
        save = true
        break
      end
      break if game.valid_piece?(current_player, input.chars)

      puts "Please select a valid piece"
    end

    break if save == true

    if game.present_move_choices(input)&.zero?
      puts "Please select another pice"
      input = gets.chomp.chars
    end

    game.save_game && break if input == "save"

    player_move = gets.chomp.to_i

    if game.match_end?(opposite_player.deliver_king, game.select_piece_to(player_move, input))
      puts "congratulations, #{current_player} wins!"
      break
    end

    game.redisplay(players)
    i += 1
  end

when "3"
  "end"
end
