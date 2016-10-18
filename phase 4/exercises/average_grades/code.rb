def average( grade_list )
  sum = 0
  grade_list.each do |grade|
    sum += grade
  end

  sum / grade_list.size.to_f
end

def average_to_letter( average )
  if average >= 90
    'A'
  elsif average >= 80
    'B'
  elsif average >= 70
    'C'
  elsif average >= 60
    'D'
  else
    'F'
  end
end

jane_grades = [ 98, 95, 88, 97, 74 ]
janes_average = average jane_grades
janes_letter = average_to_letter janes_average
puts janes_average
puts janes_letter