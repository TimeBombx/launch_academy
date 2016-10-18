class Student
  attr_reader :first_name, :last_name, :grades

  def initialize ( hash )
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @grades = hash[:grades]
    @average = average
  end

  def average
    sum = 0
    @grades.each do |grade|
      sum += grade
    end
    sum / @grades.size.to_f
  end
end

student = Student.new({
  first_name: "Corey",
  last_name: "Votta",
  grades: [70, 80, 100, 100]
})

puts student.first_name
puts student.last_name
p student.grades
puts student.average