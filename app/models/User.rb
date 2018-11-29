class User
	@@all = []
	attr_accessor :name

	def initialize(name)
		@name = name

		@@all << self
	end

	def recipes
		RecipeCard.all.select {|recipecard| recipecard.user == self}
	end

	def add_recipe_card(recipe, date, rating)
		RecipeCard.new(recipe, self, date, rating)
	end

	def declare_allergen(ingredient)
		Allergen.new(self, ingredient)
		#should accept an ingredient instance as an argument,
		#and create a new allergen instance for this user and the given ingredient
	end

	def allergens
		Allergen.all.select {|allergen| allergen.user == self}
		#return all of the ingredients this user is allergic to
	end

	def top_three_recipes
		ordered = recipes.sort_by {|recipe_card| recipe_card.rating}
		.reverse

		ordered[0..2].map { |e| e.recipe }
		#should return the top three highest rated recipes for this user.
	end

	def most_recent_recipe
		recipes.sort_by {|recipe_card| recipe_card.date}[0].recipe
		#should return the recipe most recently added to the user's cookbook.
	end

	def safe_recipes
		# user_recipes = recipes.map { |recipe_card| recipe_card.recipe }
		user_alergic_ingredients = allergens.map { |e| e.ingredient }
		# user_recipe_ingredients = user_recipes.map { |recipes| recipes.ingredients }
		# I want a list of all recipies that a user can eat
		Recipe.all.select do |recipe|
			(recipe.ingredients & user_alergic_ingredients).empty?
		end

	end

	def self.all
		@@all
	end
end