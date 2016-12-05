Validate that the title of each recipe exists.   
r = Recipe.new   
r.save!   
ActiveRecord::RecordInvalid: Validation failed: Name can't be blank, Name is invalid   

Validate that the title of each recipe is unique.   
r = Recipe.new   
r.name = "Brussels sprouts"   
r.save!   
ActiveRecord::RecordInvalid: Validation failed: Name has already been taken   

Validate that the title of each recipe contains "Brussels sprouts" in it.   
r = Recipe.new   
r.name = "test"   
r.save!   
ActiveRecord::RecordInvalid: Validation failed: Name is invalid   

Validate that the length of a comment be a maximum of 140 characters long.   
c = Comment.new   
c.recipe_id = 1   
c.body = "57yju6MiOHwWWYrZzjKRtr4nTe1D20AlfeJmT6Cm4trsSvVuQF8tkQUosAglbpIaHUeQ0D1123413413423413424557yju6MiOHwWWYrZzjKRtr4nTe1D20AlfeJmT6Cm4trsSvVuQF8tkQUosAglbpIaHUeQ0D11234134134234134245"   
c.save!   
ActiveRecord::RecordInvalid: Validation failed: Body is too long (maximum is 140 characters)   

Validate that a comment has a recipe.   
c = Comment.new   
c.body = "test"  
c.save!   
ActiveRecord::RecordInvalid: Validation failed: Recipe can't be blank

Add a field servings to your Recipe table. This field is optional, but if supplied, it must be greater than or equal to 1. Write a validation for this.
r = Recipe.new   
r.servings = 0   
r.save!   
ActiveRecord::RecordInvalid: Validation failed: Name can't be blank, Name is invalid, Serving must be greater than or equal to 1   