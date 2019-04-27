class CdsController < ApplicationController
  def index
    @cds = Cd.all.reverse_order
  end

  def new
    @cd = Cd.new
    @artists = Artist.all.reverse_order
    @labels = Label.all.reverse_order
    @categories = Category.all.reverse_order
    @disc_number = @cd.disc_numbers.build #ryo

  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      flash[:notice] = "Cd Saved!"
      redirect_to cds_path
    else
      flash[:notice] = "Error!"
      render :new
    end
  end

  def edit
    @cd = Cd.find(params[:id])
    @artists = Artist.all.reverse_order
    @labels = Label.all.reverse_order
    @categories = Category.all.reverse_order
  end

  def update
    @cd = Cd.find(params[:id])
    if @cd.update(cd_params)
      flash[:notice] = "Cd Updated!"
      redirect_to cd_path(@cd)
    else
      flash[:notice] = "Error!"
      render :edit
    end
  end

  def show
    @cd = Cd.find(params[:id])
    @comment = Comment.new
    @comment_reply = CommentReply.new
    @cart_item = CartItem.new
  end

  def destroy
    @cd = Cd.find(params[:id])
    if @cd.destroy
      redirect_to cds_path
    else
      flash[:notice] = "Error!"
      render :edit
    end
  end

  private
  def cd_params
    params.require(:cd).permit(:cd_title, :cd_image, :stock, :cd_profile, :price, :artist_id, :label_id, :category_id)
  end
end