# YOUR CODE GOES HERE
puts "Choose rock (r), paper (p), or scissors (s): "
player = gets.chomp

if !'rps'.include? player
  puts 'Invalid entry, try again.'
  exit!
end

choices_full = ['Rock', 'Paper', 'Scissors']

choices = ['r','p','s']
computer = choices[rand(choices.length)]

puts "Player chose #{ choices_full[choices.index(player)] }"
puts "Computer chose #{ choices_full[choices.index(computer)] }"

if player == computer
  puts 'Tie!'
end

# handle player win conditions first
if player == choices[0] && computer == choices[2]
  puts 'Rock beats Scissors, Player Wins!'
elsif player == choices[1] && computer == choices[0]
  puts 'Paper beats Rock, Player Wins!'
elsif player == choices[2] && computer == choices[1]
  puts 'Scissors beats paper, Player Wins!'
end

# handle computer win conditions
if computer == choices[0] && player == choices[2]
  puts 'Rock beats Scissors, Computer Wins!'
elsif computer == choices[1] && player == choices[0]
  puts 'Paper beats Rock, Computer Wins!'
elsif computer == choices[2] && player == choices[1]
  puts 'Scissors beats paper, Computer Wins!'
end