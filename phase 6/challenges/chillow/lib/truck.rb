class Truck
  attr_reader :boxes

  def initialize
    @max_boxes = 20
    @boxes = Array.new
  end

  def full?
    @boxes.size >= @max_boxes
  end

  def add_box(box)
    @boxes << box
  end

  def remove_box(box)
    @boxes.delete(box)
  end

  def remove_boxes(occupant)
    @boxes.delete_if { |box| box.occupant == occupant }
  end
end