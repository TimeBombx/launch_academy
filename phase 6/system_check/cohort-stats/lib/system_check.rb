class SystemCheck < Lesson
  attr_reader :title, :due_date, :submissions

  def initialize(title, body, due_date)
    super(title, body)
    @title = title
    @due_date = due_date
    @submissions = Array.new
  end

  def add_submission(submission)
    @submissions << submission
  end

  def average_grade
    sum = 0
    @submissions.each do |submission|
      sum += submission.grade if submission.graded?
    end
    sum / @submissions.size.to_f
  end

  def did_student_complete_system_check?(student)
    @submissions.each do |submission|
      return true if submission.student == student
    end
    return false
  end

  def submittable?
    true
  end
end
