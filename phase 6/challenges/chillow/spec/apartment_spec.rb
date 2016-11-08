require 'spec_helper'

describe Apartment do
  let(:occupant) { Occupant.new('Corey', 'Votta') }
  let(:apartment) { Apartment.new('5 Test street', 'Test City', '012345', '$950', '9/22/2012', '9/22/2013') }

  it 'should create an apartment' do
    expect(apartment).to_not be(nil)
  end

  it 'should be a child of dwelling' do
    expect(apartment.is_a? Dwelling).to be(true)
  end

  it 'should not be full' do
    expect(apartment.full?).to be(false)
  end

  it 'should be full' do
    apartment.add_roommate(occupant)
    apartment.add_roommate(occupant)
    apartment.add_roommate(occupant)
    apartment.add_roommate(occupant)
    expect(apartment.full?).to be(true)
  end

  it 'should remove a roommate' do
    apartment.remove_roommate(occupant)
    expect(apartment.full?).to be(false)
  end
end
