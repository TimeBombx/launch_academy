require_relative "./team_data"

class Team
  attr_reader :name, :players

  def initialize(name, players)
    @name = name
    @players = Array.new
    players.each do |key, value|
      @players << Player.new(value, key)
    end
  end
end
