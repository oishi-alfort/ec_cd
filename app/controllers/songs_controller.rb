class SongsController < ApplicationController
	def new
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
	end


	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		@song.update(song_params)
	end
end

private
    def song_params
	    params.require(:song).permit(:song_name,:song_order)
    end
