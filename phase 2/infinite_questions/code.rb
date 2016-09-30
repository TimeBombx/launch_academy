require 'pry'

answer = ""

while answer != "no" do
  puts "Can I get you something?"
  print ">"
  answer = gets.chomp
  binding.pry
end

puts "Bye!"