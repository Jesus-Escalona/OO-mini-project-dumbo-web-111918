require_relative '../config/environment.rb'

#Making Users
sam = User.new("Sam")
pedro = User.new("Pedro")
jose = User.new("Jose")
steven = User.new("Steven")
juan = User.new("Juan")

#Making Ingredients
pickles = Ingredient.new("Pickles")
milk = Ingredient.new("Milk")
chocolate = Ingredient.new("Chocolate")
peanuts = Ingredient.new("☠️")
butter = Ingredient.new("Butter")

#Making Recipes
cake = Recipe.new("Cake")
arepa = Recipe.new("Arepa")
tacos = Recipe.new("Taco")
pasta = Recipe.new("Pasta")

#Making Allergens
sam.declare_allergen(milk)
pedro.declare_allergen(peanuts)
juan.declare_allergen(milk)
jose.declare_allergen(peanuts)
juan.declare_allergen(pickles)
juan.declare_allergen(butter)

#Making RecipeCards
sam.add_recipe_card(cake, "09-19-2018", 3)
pedro.add_recipe_card(cake, "09-18-2018", 5)
juan.add_recipe_card(pasta, "12-10-2017", 4)
sam.add_recipe_card(pasta, "12-10-2017", 4)
sam.add_recipe_card(arepa, "12-10-2017", 3)
sam.add_recipe_card(tacos, "12-10-2017", 5)
steven.add_recipe_card(pasta, "12-10-2017", 4)

#Making RecipeIngredients
pasta.add_ingredients([butter, milk])
cake.add_ingredients([chocolate, peanuts, butter, milk])

binding.pry
"0"