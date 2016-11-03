class PersonalizedHavocError < StandardError
  def initialize(msg)
    super(msg)
  end
end

module PartyGoer
  def drink
    @numberOfDrinks = 0 if @numberOfDrinks.nil?
    @numberOfDrinks += 1
    return false if @numberOfDrinks >= 4
    return true
  end

  def sing
    'singing'
  end

  def cause_havoc
    raise PersonalizedHavocError.new("You should define this yourself!")
  end

  def invited?
    true
  end
end
