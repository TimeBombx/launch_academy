class Square
  attr_accessor :length, :width, :x, :y

  def initialize(side, x = 0, y = 0)
    @length = side
    @width = side
    @x = x
    @y = y
  end

  def diameter
    length * Math.sqrt(2)
  end

  def perimeter
    length * 4
  end

  def area
    length * width
  end

  def contains_point?(nx, ny)
    return false if nx < x || ny < y
    return false if nx >= (x + length) || ny >= (y + length)
    return true
  end
end
