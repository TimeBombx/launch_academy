puts "Hello shopper! What is your name?"
name = gets.chomp

available_items = ['old paperback book', 'potato', 'red onion', 'dried lemon',
  'frankincense', 'medicinal herbs', 'saffron', 'glass spice jar', 'red fabric',
  'orange fabric', 'handicrafts', 'small Persian rug', 'medium Persian rug',
  'large Persian rug', 'extra large Persian rug']

puts "Welcome #{name}"
puts
puts "Here is a list of items you can buy!"
available_items.each do |item|
  puts "> #{item}"
end
puts

shopping_cart = []
not_available_cart = []

while true
  puts "What would you like today? (Type FINISHED when done)"
  print ">"
  item = gets.chomp.downcase

  if item == "finished"
    break
  elsif available_items.include? item
    shopping_cart << item
    puts "Got it! Adding it to your cart."
  else
    not_available_cart << item
    puts "Sorry we do not have the item"
  end
end

puts
puts "#{name}, thanks for trying our online Souq platform. Here is a list of items in your cart!"

shopping_cart.each do |item|
  puts "> #{item}"
end

puts
puts "We noticed you tried entering in some items that aren't part of our online Souq. We don't have the following items yet but will let you know if they show up!: "

not_available_cart.each do |item|
  puts "> #{item}"
end