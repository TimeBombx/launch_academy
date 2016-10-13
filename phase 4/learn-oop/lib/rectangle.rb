class Rectangle
  attr_reader :length, :width
  attr_accessor :x, :y

  def initialize ( length, width, x = 0, y = 0 )
    @length = length
    @width = width
    @x, @y = x, y
  end

  def area
    self.length * self.width
  end

  def diagonal
    Math::sqrt( self.length**2 + self.width**2 )
  end

  def move_right
    self.x += 1
  end

  def move_left
    self.x -= 1
  end

  def move_up
    self.y += 1
  end

  def move_down
    self.y -= 1
  end
end