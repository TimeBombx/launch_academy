class Gorilla < Animal
  def initialize(name)
    super(name)
  end

  def speak
    "#{name} got a bad feeling about this..."
  end
end