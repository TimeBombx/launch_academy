answer = ""
how_many = 0

puts "What would you like today?"
answer = gets.chomp

puts "How many would you like?"
how_many = gets.chomp.to_i

how_many.times do
  puts answer
end

puts "There you go! Come again!"