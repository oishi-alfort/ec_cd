class DiscNumbersController < ApplicationController
	before_action :set_disc_number, only: [:new, :edit, :create, :update, :destroy]
	def new
		@disc_number = Disc_number.new
	end

	def edit
	end

	def create
		@disc_number  = Disc_number.new(disc_number_params)
	end

	def update
	end

	def destroy
	end

	private
	def set_disc_number
		@disc_number = Disc_number.find(params[:id])
	end

	def project_params
		params.require(:disc_number).permit(:disc_number, songs_attributes: [:id, :song_roder, :song_name, :_destroy])
	end
end
