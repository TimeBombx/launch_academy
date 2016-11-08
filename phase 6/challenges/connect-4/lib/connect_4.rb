require 'pry'
require_relative 'board'
require_relative 'player'

board = Board.new

puts "Player 1, what is your name?"
player_one = Player.new(gets.chomp)

puts "Player 2, what is your name?"
player_two = Player.new(gets.chomp)

puts

turn = 0
piece = ''

while !board.winner
  if turn.even?
    puts "It is #{player_one.name}'s turn"
    piece = 'X'
  else
    puts "It is #{player_two.name}'s turn"
    piece = 'O'
  end
  board.display

  puts "\nWhat column would you like to place your piece in?"
  col = gets.chomp.to_i

  if board.place_piece_in_column(col-1, piece)
    turn += 1
  else
    puts "That column is filled up"
  end
  system "clear"
end

winner = board.winner

board.display

if winner == 1
  puts "Player 1 has won"
elsif winner == 2
  puts "Player 2 has won"
end