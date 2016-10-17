# YOUR CODE GOES HERE
class Ingredient
  attr_reader :quantity, :unit, :name

  PERMITTED_INGREDIENTS = [
    "Brussels sprouts",
    "spinach",
    "eggs",
    "milk",
    "tofu",
    "seitan",
    "bell peppers",
    "quinoa",
    "kale",
    "chocolate",
    "beer",
    "wine",
    "whiskey"
  ]

  def initialize ( quantity, unit, name )
    @unit = unit
    @name = name
    @quantity = quantity
  end

  def summary
    "#{ quantity } #{ unit } #{ name }"
  end

  def valid
    PERMITTED_INGREDIENTS.include? name
  end

  def self.parse ( string )
    args = string.split(" ")
    name = args[2]
    unit = args[1]
    quantity = args[0]

    Ingredient.new( quantity, unit, name )
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

  def can_have_dish?
    ingredients.each do |ingredient|
      return false if !ingredient.valid
    end
    true
  end

  private
    def ingredients_summary
      list = ""
      ingredients.each do |ingredient|
        list += "- #{ ingredient.summary } \n"
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

# ingredient = Ingredient.new( 47.0, "lb(s)", "Brussels Sprouts" )
# puts ingredient.summary
#
# ingredients = [
#     Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
#     Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
#     Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
#     Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
# ]
#
# instructions = [
#     "Preheat oven to 400 degrees F.",
#     "Cut off the brown ends of the Brussels sprouts.",
#     "Pull off any yellow outer leaves.",
#     "Mix them in a bowl with the olive oil, salt and pepper.",
#     "Pour them on a sheet pan and roast for 35 to 40 minutes.",
#     "They should be until crisp on the outside and tender on the inside.",
#     "Shake the pan from time to time to brown the sprouts evenly.",
#     "Sprinkle with more kosher salt ( I like these salty like French fries).",
#     "Serve and enjoy!"
# ]
#
# recipe = Recipe.new( "Roasted Brussels Sprouts", instructions, ingredients )
# puts recipe.summary

safe_name = "Chocolate Quinoa"
safe_ingredients = [
  Ingredient.parse( "1.0 cup quinoa" ),
  Ingredient.new(1.0, "cup", "chocolate")
]
safe_instructions = [
  "Melt chocolate.",
  "Pour over quinoa.",
  "Regret your life."
]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
puts "Is #{ safe_recipe.name } safe? #{ safe_recipe.can_have_dish? }"