class Ingredient
	@@all = []
	attr_accessor :name

	def initialize(name)
		@name = name

		@@all << self
	end

	def self.most_common_allergen
		a = Allergen.all.map { |allergen| allergen.ingredient }
		freq = a.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		a.max_by { |v| freq[v] }
		#should return the ingredient instance that the highest number of users are allergic to
	end

	def allergen?
		Allergen.all.any? { |allergen| allergen.ingredient == self }
	end

	def self.all
		@@all
	end
end
