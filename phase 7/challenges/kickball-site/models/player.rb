require_relative "./team_data"

class Player
  attr_reader :name, :position

  def initialize(name, position)
    @name = name
    @position = position
  end
end
