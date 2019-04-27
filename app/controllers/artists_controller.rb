class ArtistsController < ApplicationController
  
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:notice] = "Artist Saved!"
      redirect_to artist_path(@artist.id)
    else
      flash[:notice] = "Error!"
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      flash[:notice] = "Artist Updated!"
      redirect_to artist_path(@artist.id)
    else
      flash[:notice] = "Error!"
      render :edit
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist = Artist.find(params[:id])
    if @artist.destroy
      redirect_to cds_path
    else
      flash[:notice] = "Error!"
      redirect_to artist_path(@artist)
    end
  end

  private
  def artist_params
  	params.require(:artist).permit(:artist_name, :artist_profile, :artist_image)
  end
end