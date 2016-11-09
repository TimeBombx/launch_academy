class SystemCheckSubmission
  attr_reader :solution, :student, :grade

  def initialize(solution, student)
    @solution = solution
    @student = student
    @grade = -1
  end

  def assign_grade(grade)
    raise InvalidGradeError if grade < 0
    @grade = grade
  end

  def graded?
    grade >= 0
  end
end

class InvalidGradeError < StandardError
end
