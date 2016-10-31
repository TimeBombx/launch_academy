class Circle
  attr_accessor :radius, :x, :y

  def initialize(radius, x = 0, y = 0)
    @radius = radius
    @x, @y = x, y
  end

  def diameter
    radius * 2
  end

  def area
    3.14159 * radius ** 2
  end

  def perimeter
    2 * 3.14 * radius
  end
end
