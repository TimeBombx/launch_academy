class Cohort
  attr_reader :title, :start_date, :end_date, :students, :system_checks, :career_day

  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = Array.new
    @system_checks = Array.new
    @career_day = end_date.next_day(4)
  end

  def enroll(student)
    @students << student
  end

  def assign(system_check)
    @system_checks << system_check
  end

  def roster
    roster = "Cohort: #{title}"
    @students.each do |student|
      roster += "#{student.name} #{student.email}\n"
    end
    roster
  end

  def system_check_completed?(system_check)
    @students.each do |student|
      return false unless system_check.did_student_complete_system_check?(student)
    end
    return true
  end
end
