class FavoritesController < ApplicationController
	def create
		cd = Cd.find(params[:cd_id])
		favorite = cd.favorites.build
		favorite.user_id = current_user.id
		favorite.save
		redirect_to cds_path
	end

	def destroy
		cd = Cd.find(params[:cd_id])
		favorite = current_user.favorites.find_by(cd_id: cd.id)
		favorite.destroy
		redirect_to cds_path
	end
end
