names = [
  "John",
  "Hannah",
  "Mark",
  "Sam",
  "Anna",
  "Sandra",
  "Susan",
  "Julie",
  "Yanni",
  "Eve",
  "Sunny",
  "Matt"
]

## Accessing elements within our `names` array:

# 1. Retrieve the first name from the `names` array.
puts "First name in the array is: #{names[0]}"
# 2. Retrieve the second name from the `names` array.
puts "Second name in the array is: #{names[1]}"
# 3. Retrieve the third name from the `names` array.
puts "Third name in the array is: #{names[2]}"
# 4. Retrieve the last name from the `names` array.
puts "Last name in the array is: #{names[-1]}"
# 5. Retrieve the second-to-last name from the `names` array.
puts "Second to last name in the array is: #{names[-2]}"
# 6. Create a new array with the first two elements in the `names` array.
puts names.take(2)
puts
# 7. Create a new array with the first four elements in the `names` array.
puts names.take(4)
puts

## Manipulating the `names` array:

# 1. Add your name to the `names` array.
puts names << "Corey"
puts
# 2. Replace the first element in the array with your best friend's name.
puts names[0] = "Miguel"
puts
# 3. Reassign the last element in the array with the name of your arch-nemesis.
puts names[-1] = "Batman"
puts

## Asking questions about our `names` array:

# 1. How many names are on the list?
puts names.count
puts
# 2. Who is the third name on the list?
puts names[2]
puts
# 3. Output each name and where it occurs in the array.
names.each_with_index do |item, index|
  puts "> #{item} @ #{index}"
end
puts
# 4. Sort the names in alphabetical order.
puts names.sort!
puts
# 5. Sort the names by smallest number of characters to largest.
puts names.sort_by { |item| item.length }
puts
# 6. Supply the sum of all the characters in the list of names.
puts names.join("").length
puts
# 7. Do any of the names start with "y"?
puts names.any? { |item| item.start_with? "y"  }
puts
# 8. Are all of the names 3 characters long or larger?
puts names.all? { |item| item.length >= 3  }
puts
# 9. Using the `names` array, create a new array containing only palindrome names.
puts "#{names.select { |item| item == item.reverse }}"
puts
# 10. Find the first name that starts with "S".
puts names.bsearch { |item| item.start_with? "S" }
puts
# 11. Create a new array containing names that start with "S".
puts names.select { |item| item.start_with? "S"  }
puts
# 12. Create a new array of names ending with a vowel.
puts names.select { |item| item.start_with? "S"  }
puts
# 13. Divide the names into groups of 3.
puts names.each_slice(3) { |new_array| puts new_array.inspect }
puts