require 'spec_helper'

describe Truck do
  let(:occupant) { Occupant.new('Corey', 'Votta') }
  let(:truck) { Truck.new }
  let(:box) { Box.new(occupant) }

  it 'should create a truck' do
    expect(truck).to_not be(nil)
  end

  describe 'add/remove' do
    before(:each) do
      truck.add_box(box)
      truck.add_box(box)
      truck.add_box(box)
    end

    it 'should add boxes to truck' do
      expect(truck.boxes.size).to be(3)
    end

    it 'should remove boxes from truck' do
      truck.remove_box(box)
      expect(truck.boxes.size).to be(0)
    end

    it 'should remove all boxes that belong to occupant' do
      truck.remove_boxes(occupant)
      expect(truck.boxes.size).to be(0)
    end
  end

  it 'should not be full' do
    expect(truck.full?).to be(false)
  end

  it 'should be full' do
    20.times do |i|
      truck.add_box(box)
    end
    expect(truck.full?).to be(true)
  end
end
