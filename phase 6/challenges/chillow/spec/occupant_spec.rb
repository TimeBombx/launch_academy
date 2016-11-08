require 'spec_helper'

describe Occupant do
  let(:occupant) { Occupant.new('Corey', 'Votta') }

  it "should create a new occupant" do
    expect(occupant).to_not be(nil)
  end
end
