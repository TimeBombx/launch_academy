class Rectangle
  attr_reader :width, :height

  def initialize ( width, height = nil )
    @width = width
    @height = height || width
  end

  def area
    @area = @width * @height
  end
end

rect = Rectangle.new( 20 )
puts rect.area