def perimeter(width, height = nil)
  if height.nil?
    width * 4
  else
    2 * width + 2 * height
  end
end

def average(grade_list)
  sum = 0
  grade_list.each do |grade|
    sum += grade
  end

  sum / grade_list.size.to_f
end

def rankings(students)
  ranking_string = ""
  students.each_with_index do |student, index|
    ranking_string += "#{index + 1}. #{student}\n"
  end
  ranking_string
end

def greet(name, language = nil)
  if language == 'spanish'
    "Hola #{name}!"
  elsif language == 'italian'
    "Ciao #{name}!"
  elsif language == 'french'
    "Bonjour #{name}!"
  else
    "Hi #{name}!"
  end
end

def create_puzzle(word, guesses = [])
  split_word = []
  word.split("").each do |character|
    if guesses.include?(character)
      split_word << character
    else
      split_word << "_"
    end
  end
  split_word.join(" ")
end

def divisible_by_three(number)
  number % 3 == 0
end

def perfect_square?(number)
  if number < 1
    raise ArgumentError, "number must be greater than or equal to one"
  end

  current_number = 1
  until current_number ** 2 > number
    return true if current_number ** 2 == number
    current_number += 1
  end
  false
end
