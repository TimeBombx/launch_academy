class Video < Lesson
  attr_reader :url

  def initialize(name, body, url)
    super(name, body)
    @url = url
  end
end