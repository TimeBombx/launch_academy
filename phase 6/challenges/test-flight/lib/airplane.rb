class Airplane
  attr_reader :type, :wing_loading, :horse_power

  def initialize(type, wing_loading, horse_power)
    @type = type
    @wing_loading = wing_loading
    @horse_power = horse_power
    @started = false
  end

  def start
    return "airplane already started" if @started

    @started = true
    "airplane started"
  end

  def takeoff
    return "airplane not started, please start" unless @started

    @flying = true
    "airplane launched"
  end

  def land
    return "airplane not started, please start" unless @started
    return "airplane already on the ground" unless @flying

    @flying = false
    "airplane landed"
  end
end
