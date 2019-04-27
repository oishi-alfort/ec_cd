class RootController < ApplicationController
	def top
		@categories = Category.all 
		@pickups = Pickup.all
	end

	def about
	end
end
