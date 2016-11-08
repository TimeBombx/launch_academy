require 'spec_helper'

describe Dwelling do
  let(:occupant) { Occupant.new('Corey', 'Votta') }
  let(:dwelling) { Dwelling.new('5 Test street', 'Test City', 'Test state', '012345') }

  it 'should create a dwelling' do
    expect(dwelling).to_not be(nil)
  end
end
