puts "What difficulty would you like to play?"
puts "Type easy or hard: "
difficulty = gets.chomp

random_num = (difficulty == "easy" ? rand(9) : rand(19)) + 1

puts "I've picked a number between 1 and #{ difficulty == "easy" ? 10 : 20 }. Now guess it!"

guess = 0
score = 0

begin
  print "> "
  guess = gets.chomp.to_i
  puts "Nope, try again!"
  score += 1
end while guess != random_num

puts "You win! Nice job!"
puts "Your score was: #{ score }"