#YOUR CODE GOES HERE
class Ingredient
  attr_reader :quantity, :unit, :name

  def initialize ( quantity, unit, name )
    @unit = unit
    @name = name
    @quantity = quantity
  end

  def summary
    "#{ quantity } #{ unit } #{ name }"
  end
end

class Recipe
  attr_reader :name, :instructions, :ingredients

  def initialize ( name, instructions, ingredients )
    @name = name
    @ingredients = ingredients
    @instructions = instructions
  end

  def summary
    [
      "Name: #{ name }\n",
      "Ingredients",
      "#{ ingredients_summary }\n",
      "Instructions",
      "#{ instructions_summary }",
    ].join("\n")
  end

  private
    def ingredients_summary
      list = ""
      ingredients.each do |ingred|
        list += "- #{ ingred.summary } \n"
      end
      list
    end

    def instructions_summary
      list = ""
      instructions.each_with_index do |instruct, index|
        list += "#{ index + 1 }. #{ instruct } \n"
      end
      list
    end
end

ingredient = Ingredient.new( 47.0, "lb(s)", "Brussels Sprouts" )
# puts ingredient.summary

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
]

recipe = Recipe.new( "Roasted Brussels Sprouts", instructions, ingredients )
puts recipe.summary