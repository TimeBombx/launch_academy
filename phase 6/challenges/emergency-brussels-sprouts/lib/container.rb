class Container
  attr_reader :weight, :maximum_holding_weight
  attr_accessor :ingredients

  def initialize(weight, max)
    @weight = weight
    @maximum_holding_weight = max
    @ingredients = Array.new
  end

  def fill_with_ingredient(ingredient)
    items = (maximum_holding_weight/ingredient.weight).to_i
    items.times do
      @weight += ingredient.weight
      ingredients << ingredient
    end
    @weight = weight.round
  end

  def which_ingredient
    ingredients.first.name
  end

  def how_many_ingredients
    ingredients.count
  end

  def remove_one_ingredient
    ingredients.pop
  end

  def empty
    ingredients = Array.new
  end
end
