class RootController < ApplicationController
	def top
		@categories = Category.all 
	end

	def about
	end
end
