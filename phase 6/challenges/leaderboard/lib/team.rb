class Team
  attr_reader :name, :rank
  attr_accessor :wins, :losses

  def initialize(name, rank = nil, wins = 0, losses = 0)
    @name = name
    @rank = rank
    @wins = wins
    @losses = losses
  end
end
