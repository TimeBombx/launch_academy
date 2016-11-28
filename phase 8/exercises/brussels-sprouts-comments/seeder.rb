require 'pg'
require 'pry'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

COMMENTS = [
  "This is good!",
  "Delicious",
  "This isn't very good",
  "My whole family loved it",
  "Brussel sprouts should be wiped off this earth"
]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE
def db_connection
  begin
    connection = PG.connect(dbname: "brussels_sprouts_recipes")
    yield(connection)
  ensure
    connection.close
  end
end

def seed
  db_connection do |conn|
    TITLES.each do |title|
      conn.exec_params('INSERT INTO recipes (title) VALUES($1)', [title])
      recipe = conn.exec_params('SELECT id FROM recipes WHERE title=$1', [title])

      num_of_comments = rand(COMMENTS.count)
      num_of_comments.times do |i|
        conn.exec_params('INSERT INTO comments (recipe, comment) VALUES($1, $2)', [recipe.getvalue(0, 0), COMMENTS[rand(COMMENTS.count-1)]])
      end
    end
  end
end

#run the seeder
# seed

def total_num_of_recipes
  db_connection { |conn| conn.exec_params('SELECT * FROM recipes').ntuples }
end

def total_num_of_comments(num = 0)
  db_connection { |conn| conn.exec_params("SELECT * FROM comments #{"WHERE recipe=$1" if num > 0}", ([num] if num > 0)).ntuples }
end

def comments_on_recipes
  recipes = db_connection { |conn| conn.exec_params('SELECT * FROM recipes') }
  # binding.pry
  recipes.ntuples.times do |i|
    recipe_id = recipes.getvalue(i, 0).to_i
    recipe_title = recipes[i]['title']
    comments = total_num_of_comments(recipe_id)
    puts "#{recipe_title} has #{comments} comments"
  end
end

def get_recipe_from_comment
  comment = db_connection { |conn| conn.exec('SELECT * FROM comments WHERE id=61') }
  recipe_id = comment.getvalue(0, 1)
  recipe = db_connection { |conn| conn.exec_params('SELECT * FROM recipes WHERE id=$1', [recipe_id]) }
  "#{comment.getvalue(0, 2)}; is attached to the recipe: #{recipe.getvalue(0, 1)}"
end

puts "Total num of recipes: #{total_num_of_recipes}"
puts
puts "Total num of comments: #{total_num_of_comments}"
puts
comments_on_recipes
puts
puts get_recipe_from_comment