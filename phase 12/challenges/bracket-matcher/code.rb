#YOUR CODE GOES HERE
def bracket_match(string)
  return true if string.include?("(") && string.include?(")")
  return false
end

puts bracket_match("Hi! What is your name again (I forgot)?")
puts bracket_match("Hi! What is (your name again? I forgot")