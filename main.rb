require_relative "lib/board"
require_relative "lib/game"

game = Game.new
board = Board.new

game.player_init
game.define_side
players = game.player_list
board.display(players)
i = 0
loop do
  current_player = players[i % players.length] # loop trough every player
  opposite_player = players[(i + 1) % players.length]
  puts <<~HEREDOC
    It is #{current_player.name} turn, please select a #{current_player.side} piece!

    Please select the piece piece you want to move! (Column,row).

  HEREDOC

  puts " #{current_player.name} is in check" if board.check?(current_player.deliver_king)
  puts " #{current_player.name} is in mate" if board.mate?(current_player.deliver_king, opposite_player.piece_set)
  input = ""
  loop do
    input = gets.chomp.chars

    break if board.valid_piece?(current_player, input)

    puts "Please select a valid piece"
  end

  board.present_move_choices(input)
  player_move = gets.chomp.to_i
  board.select_piece_to(player_move, input)
  board.display(players)
  i += 1
end
