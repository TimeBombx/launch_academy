# YOUR CODE HERE
train_times = [ 2, 5, 7.5, 8.5, 9, 10, 11.5, 13.5, 14.5, 17, 18, 19, 24 ]

puts "What time are you leaving?"
user_time = gets.chomp.to_f

train_time = train_times.find { |num| num > user_time }
train_index = train_times.index(train_time) + 1

puts "You should catch Train #{ train_index } leaving at #{train_time}"

if train_index == 13
  puts "
  ***DON'T STOP...BELIEVIN'!***

  Just a small town girl
  Living in a lonely world
  She took the midnight train going anywhere
  Just a city boy
  Born and raised in South Detroit
  He took the midnight train going anywhere

  A singer in a smoky room
  A smell of wine and cheap perfume
  For a smile they can share the night
  It goes on and on and on and on

  Strangers waiting, up and down the boulevard
  Their shadows searching in the night
  Streetlights people, living just to find emotion
  Hiding, somewhere in the night."
end
