#YOUR CODE GOES HERE
def caesar_cipher(string, number)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  new_string = []
  split_string = string.split("")
  split_string.each do |a|
    number.times { |i| a.next! } if letters.include?(a)
    new_string << a
  end
  new_string.join("")
end

puts caesar_cipher("a", 2)
puts caesar_cipher("Caesar!", 2)
