class Ingredient
  attr_reader :weight, :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def self.create_from_grams(name, weight)
    Ingredient.new(name, weight / 1000)
  end
end
