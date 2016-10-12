class Circle
  attr_reader :radius

  def initialize( input )
    if input.kind_of? Hash
      @radius = input[:radius] || input[:diameter] / 2
    else
      @radius = input
    end
  end
end

circle = Circle.new( { :diameter => 20 } )
circle2 = Circle.new( { :radius => 20 } )
circle3 = Circle.new( 80 )

require "pry"
binding.pry
