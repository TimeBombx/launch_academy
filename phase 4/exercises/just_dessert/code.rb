class CookieInventory
  attr_accessor :peanut_butter, :chocolate_chip, :sugar

  def initialize
    @cookies = Hash.new
    @cookies['peanut butter'] = 0
    @cookies['chocolate chip'] = 0
    @cookies['sugar'] = 0
  end

  def cook_batch! ( type, amount )
    @cookies[type] = amount
  end

  def sell! ( type, amount )
    amount.times do |i|
      if @cookies[type] >= 1
        @cookies[type] -= 1
        puts "Sold a cookie"
      else
        puts "Sold Out!"
      end
    end
  end
end

c = CookieInventory.new
puts c.cook_batch!( 'peanut butter', 10 )
c.sell!( 'peanut butter', 11 )