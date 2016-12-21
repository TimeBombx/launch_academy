#YOUR CODE GOES HERE
def minimum_consecutive_integers(array)
  array.sort!
  min = array[0]
  max = array[array.length - 1]
  numbers = (min..max).to_a
  (numbers - array).length
end

p minimum_consecutive_integers([1, 3])
p minimum_consecutive_integers([2, 5])
p minimum_consecutive_integers([-1, 4])