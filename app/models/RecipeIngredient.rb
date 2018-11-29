class RecipeIngredient
	@@all = []
	attr_accessor :recipe, :ingredient

	def initialize(recipe, ingredient)
		@recipe = recipe
		@ingredient = ingredient

		@@all << self
	end

	def someone_alergic_to_this?
		Allergen.all.any? { |allergen| allergen.ingredient == self.ingredient }
	end

	def self.all
		@@all
	end
end