class Exam
  attr_writer :assigned_to
  attr_accessor :grade

  def initialize ( title, due_date )
    @title = title
    @due_date = due_date
    @assigned_to = nil
    @grade = nil
  end
end