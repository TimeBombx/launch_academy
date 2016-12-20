#YOUR CODE GOES HERE
def minimum_coins(number)
  coins = [1, 5, 10, 25, 50, 100]
  total = 0
  coin_combo = []

  while total < number
    coins.reverse.each do |coin|
      if coin + total <= number
        total += coin
        coin_combo << coin
        break
      end
    end
  end
  coin_combo
end

p minimum_coins(35).sort!
puts
p minimum_coins(37).sort!
puts
p minimum_coins(101).sort!
puts