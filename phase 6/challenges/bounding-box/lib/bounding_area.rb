require_relative 'bounding_box'

class BoundingArea
  def initialize(boxes)
    @boxes = boxes
  end

  def boxes_contain_point?(x, y)
    @boxes.each do |box|
      return true if box.contains_point?(x, y)
    end
    return false
  end
end
