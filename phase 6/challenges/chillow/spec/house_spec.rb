require 'spec_helper'

describe House do
  let(:occupant) { Occupant.new('Corey', 'Votta') }
  let(:house) { Dwelling.new('5 Test street', 'Test City', 'Test state', '012345') }

  it 'should create a house' do
    expect(house).to_not be(nil)
  end

  it 'should be a child of dwelling' do
    expect(house.is_a? Dwelling).to be(true)
  end
end
