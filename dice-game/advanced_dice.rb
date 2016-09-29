# YOUR ADVANCED CODE, HERE
dice_sides = 0
rolls = 0

puts "How many sides does your dice have?"
dice_sides = gets.chomp.to_i

puts "How many times would you like to roll your dice?"
rolls = gets.chomp.to_i

continue = ""

while continue != "n" do
  rolls.times do
    role_1 = rand(dice_sides)
    role_2 = rand(dice_sides)

    puts "You roled a #{role_1} and a #{role_2}. Total: #{role_1+role_2}"
  end

  puts "Roll Again? (Y/n) > "
  continue = gets.chomp
end