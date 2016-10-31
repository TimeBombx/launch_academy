# YOUR CODE HERE
def plus_two(num)
  num + 2
end

def subtract_or_multiply_by_two(num)
  return num -= 2 if num < 0
  return num *= 2 if num >= 0
end

def repeat_last_word(sentence)
  words = sentence.split(" ")
  sentence + " " + words[-1]
end

def return_value_of_type(type)
  values = {
    string: "Test",
    fixnum: 10,
  }
  values[type] || "input does not match any Ruby class"
end

def raise_standard_error
  raise StandardError
end

def add_five_and_ten(array)
  array << 5
  array << 10
end
