answer = ""
how_many = 0

puts "What would you like today?"
answer = gets.chomp

puts "How many would you like?"
how_many = gets.chomp

if how_many == "tons"
  while rand(14) != 0 do
    puts answer
  end
else
  how_many.to_i.times do
    puts answer
  end
end

puts "There you go! Come again!"