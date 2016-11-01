class BoundingBox
  attr_reader :width, :height, :x, :y

  def initialize(x, y, width, height)
    @x, @y = x, y
    @width, @height = width, height
  end

  def left
    x
  end

  def right
    x + width
  end

  def top
    y + height
  end

  def bottom
    y
  end

  def contains_point?(nx, ny)
    return false if nx < x || ny < y
    return false if nx > right || ny > top
    return true
  end
end
