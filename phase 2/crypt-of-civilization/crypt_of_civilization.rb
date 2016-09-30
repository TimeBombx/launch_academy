# Your code, here.
crypt_of_civilization = Array.new

crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "Plastic savings bank"
crypt_of_civilization << "Set of scales"
crypt_of_civilization << "Toast-O-Lator"
crypt_of_civilization << "Sample of aluminum foil"
crypt_of_civilization << "Donald Duck doll"

extra = ["Container of beer", "Lionel model train set", "Ingraham pocket watch"]

crypt_of_civilization.concat(extra)

puts "Number of items: #{crypt_of_civilization.count}"
puts "First item: #{crypt_of_civilization.first}"
puts "Last item: #{crypt_of_civilization.last}"
puts "Second item: #{crypt_of_civilization[1]}"
puts "Third item: #{crypt_of_civilization[2]}"
puts "Second to last item: #{crypt_of_civilization[-2]}"
puts "Index of 'Toast-O-Lator': #{crypt_of_civilization.index("Toast-O-Lator")}"

puts
puts

puts "Array contains Container of beer? #{ crypt_of_civilization.include?("Container of beer") }"
puts "Array contains Toast-O-Lator? #{ crypt_of_civilization.include?("Toast-O-Lator") }"
puts "Array contains Plastic bird? #{ crypt_of_civilization.include?("Plastic bird") }"

puts
puts

puts "Sort array by word length"
crypt_of_civilization.sort { |item| item.length }.each do |item|
  puts "> #{item}"
end
puts
puts "Sort array in alphabetical order"
crypt_of_civilization.sort.each do |item|
  puts "> #{item}"
end
puts
puts "Sort array in reverse alphabetical order"
crypt_of_civilization.sort.reverse.each do |item|
  puts "> #{item}"
end
puts
count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end
puts
crypt_of_civilization.each do |item|
  puts item
end

crypt_of_civilization.shift
crypt_of_civilization.pop
crypt_of_civilization.delete("set of scales")
crypt_of_civilization.delete("Sample of aluminum foil")
