class SuperHero
  attr_reader :public_identity

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

  private
    attr_reader :secret_identity
end

class Speedster < SuperHero
  def backstory
    "Speedster"
  end

  def powers
    "super fast"
  end

  def weakness
    "quick sand"
  end

  def speed_in_mph
    60000
  end
end

class Brawler < SuperHero
  def backstory
    "Street fighter"
  end

  def powers
    "Super strength"
  end

  def weakness
    "none"
  end

  def health
    2000
  end
end

class Detective < SuperHero
  def backstory
    "The Detective"
  end

  def powers
    "Ultra detecting"
  end

  def weakness
    "Luke Bayne"
  end

  def speed_in_mph
    10
  end
end

class Demigod < SuperHero
  def backstory
    "demigod"
  end

  def powers
    "super strength, flying"
  end

  def weakness
    "his father"
  end

  def home
    "Cosmic Plane"
  end
end

class JackOfAllTrades < SuperHero
  def backstory
    "Water based hero"
  end

  def powers
    "swims fast"
  end

  def weakness
    "unknown"
  end

  def species
    "Alien"
  end

  def home
    "Venus"
  end

  def psychic?
    true
  end
end

class WaterBased < SuperHero
  def backstory
    "Water based hero"
  end

  def powers
    "swims fast"
  end

  def weakness
    "air"
  end

  def home
    "Earth's Oceans"
  end

  def fans_per_thousand
    5
  end

  def psychic?
    true
  end
end
