class CoffeeCup
  attr_accessor :amount, :max_amount

  def initialize( amount = 8, max_amount = 12 )
    @amount = amount
    @max_amount = max_amount
  end

  def sip!
    @amount > 0 ? @amount -= 1 : puts "Cup is empty. You need to refill!"
  end

  def spill!
    @amount = 0
  end

  def refil!
    @amount = @max_amount - 2
  end
end