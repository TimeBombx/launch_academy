puts "What is your name?"
name = gets.chomp

time_capsule = []

while true
  puts "What would you like to store in you time capsule? (Type FINISHED when done)"
  print ">"
  item = gets.chomp.downcase

  if item == "finished"
    break
  else
    puts "How many of that item?"
    count = gets.chomp.to_i
    item = "#{item} (#{count})" if count > 0
    time_capsule << item
  end
end

puts
puts "#{name}, thanks for trying out Time Capsule maker. Here are your items: "

time_capsule.each do |item|
  puts "> #{item}"
end