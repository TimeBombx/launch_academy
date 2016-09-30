# YOUR CODE, HERE
continue = ""

while continue != "S" do
  role_1 = rand(6)
  role_2 = rand(6)

  puts "You roled a #{role_1} and a #{role_2}"
  puts "Total: #{role_1+role_2}"

  puts "'Enter' to role againm 'S' to stop"
  continue = gets.chomp
end