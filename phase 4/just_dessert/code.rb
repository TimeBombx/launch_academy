class CookieInventory
  attr_accessor :peanut_butter, :chocolate_chip, :sugar

  def initialize
    @peanut_butter = 0
    @chocolate_chip = 0
    @sugar = 0
  end

  def cook_batch! ( type, amount )
    
  end
end

c = CookieInventory.new
c.cook_batch! 'sugar', 10