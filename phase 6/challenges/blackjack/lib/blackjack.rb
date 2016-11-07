require_relative "deck"
require_relative "hand"
require_relative "card"

player = Hand.new
computer = Hand.new
deck = Deck.new

puts "Starting game..."

puts "Dealing player 2 cards"
player.add_cards deck.deal(2)

player.cards.each { |card| puts "Player was dealt: #{card.display}" }
puts

puts "Dealing computer 2 cards"
computer.add_cards deck.deal(2)

input = ''
while (input != "S" && input != "s") && player.score <= 21
  puts "Your hand: "
  player.cards.each { |card| puts card.display }
  puts "Current score: #{player.score}"

  print "Hit or stand (H/S): "
  input = gets.chomp

  if input == "H" || input == "h"
    player.add_cards deck.deal(1)
  end
end
puts

if player.score > 21
  puts "Bust! Game over..."
  exit
end

puts "Hitting dealer"
while computer.score < 17
  computer.add_cards deck.deal(1)
end

computer.cards.each { |card| puts "Dealer was dealt: #{card.display}" }
puts

if computer.score > 21
  puts "Bust! You win!"
  exit
else
  puts "Dealer Stands"
end

if computer.score > player.score
  puts "You lose!"
else
  puts "You win!"
end