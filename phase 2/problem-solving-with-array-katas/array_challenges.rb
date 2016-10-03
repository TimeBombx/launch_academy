# YOUR CODE, HERE
require 'prime'

long_string = "Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum"

puts long_string.split(" ").sort! { |a, b| b.length <=> a.length }[0]


secret_message = "7 15 15 4 27 4 15 7"
alphabet = "abcdefghijklmnopqrstuvwxyz "

message = ""
secret_message.split(' ').each do |num|
  message << alphabet[num.to_i - 1, 1]
end
puts message

random_numbers = []
10.times do
  random_numbers << rand(9) + 1
end

prime_numbers = Array.new
random_numbers.each do |num|
  prime_numbers << num if Prime.prime?(num)
end

prime_numbers.each { |num| puts num }