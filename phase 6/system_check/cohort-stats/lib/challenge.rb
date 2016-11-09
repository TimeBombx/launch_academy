class Challenge < Lesson
  def initialize(name, body)
    super(name, body)
  end

  def submittable?
    true
  end
end