menu = {
  "hamburger" => 4.00,
  "hotdog" => 3.00,
  "fires" => 2.00,
  "chips" => 1.00,
  "water" => 1.25,
  "soda" => 1.50
}
items = []

puts "Welcome to Goodburger, home of the Goodburger! Can I take your order?"
print "> "
order = gets.chomp.downcase
items = order.split(",")

price = 0
items.each do |item|
  price += menu[item] if menu.has_key? item
end

puts "Thanks! Your total is $#{ '%.2f' % price }. Have a nice day!"