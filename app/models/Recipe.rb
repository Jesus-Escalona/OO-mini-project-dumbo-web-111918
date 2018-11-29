class Recipe
	@@all = []
	attr_accessor :name

	def initialize(name)
		@name = name

		@@all << self
	end

	def self.most_popular
		a = RecipeCard.all.map { |recipe_card| recipe_card.recipe }
		freq = a.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		a.max_by { |v| freq[v] }
		#return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
	end

	def users
		RecipeCard.all.select { |recipe_card| recipe_card.recipe == self }
		.map { |recipe_card| recipe_card.user }
		#return the user instances who have recipe cards with this recipe
	end

	def ingredients
		RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
		.map { |recipe_ingredient| recipe_ingredient.ingredient }
		#return all of the ingredients in this recipe
	end

	def allergens
		ingredients.select { |ingredient| ingredient.allergen?}
		#should return all of the ingredients in this recipe that are allergens
	end

	def add_ingredients(ingredients)
		ingredients.map { |e| RecipeIngredient.new(self, e) }
		#should take an array of ingredient instances as an argument,
		#and associate each of those ingredients with this recipe
	end

	def self.all
		@@all
	end
end