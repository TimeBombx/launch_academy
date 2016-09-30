# Your code, here.

puts "Enter your values here!"

sum = 0.0

while sum < 100 do
  print "> "
  input = gets.chomp.to_f
  sum += input
end

puts "You've reached 100!"