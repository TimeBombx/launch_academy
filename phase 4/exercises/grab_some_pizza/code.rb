class Pizza
  attr_accessor :type

  TOPPINGS = {
    cheese: 0.10,
    green_pepper: 0.30,
    onion: 0.50,
    mushroom: 0.70,
    pepperoni: 1.10,
    jalapeno: 1.30,
    sausage: 1.70,
    bacon: 1.90
  }

  def initialize( type=[:cheese] )
    @type = type
  end

  def cost
    cost = 8.00
    @type.each do |topping|
      cost += TOPPINGS[topping]
    end
    "#{ '%.2f' % cost}"
  end

  def meats
    [:sausage, :pepperoni, :bacon]
  end

  def other_toppings
    [:cheese, :green_pepper, :onion, :mushroom, :jalepeno]
  end

  def self.toppings
    TOPPINGS.each do |topping, cost|
      formatted_topping_name = topping.to_s.gsub('_',' ')
      formatted_cost = '%.2f' % cost
      puts "#{formatted_topping_name} - $#{formatted_cost}"
    end
  end
end

Pizza.toppings
pizza = Pizza.new( [:cheese, :onion, :bacon] )
puts "Cost of the pizza is: $#{ pizza.cost }"