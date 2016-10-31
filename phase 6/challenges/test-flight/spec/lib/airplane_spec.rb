require_relative "../../lib/airplane"

describe Airplane do
  describe "#initialization" do
    my_plane = Airplane.new("cesna", 10, 150)

    it 'should have a type' do
      expect(my_plane.type).to eq("cesna")
    end

    it 'should have a wing_loading' do
      expect(my_plane.wing_loading).to eq(10)
    end

    it 'should have a horse_power' do
      expect(my_plane.horse_power).to eq(150)
    end

    it 'type shouldn\'t be editable' do
      expect{ my_plane.type = "test" }.to raise_error(NoMethodError)
    end
  end

  describe "#start" do
    my_plane = Airplane.new("cesna", 10, 150)

    it 'should start the plane' do
      expect(my_plane.start).to eq("airplane started")
    end

    it 'should already be started' do
      expect(my_plane.start).to eq("airplane already started")
    end
  end

  describe "#land" do
    my_plane = Airplane.new("cesna", 10, 150)

    it 'should not be started' do
      expect(my_plane.land).to eq("airplane not started, please start")
    end

    it 'should not have taken off' do
      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")
    end

    it 'should land on the ground' do
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end
  end

  describe "#takeoff" do
    my_plane = Airplane.new("cesna", 10, 150)

    it 'should not take off' do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end

    it 'should take off' do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
  end
end
