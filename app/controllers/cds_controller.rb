class CdsController < ApplicationController
  def index
    @cds = Cd.all.reverse_order
    @cart_item = CartItem.new
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
      @artists = Artist.all.reverse_order
      @labels = Label.all.reverse_order
      @categories = Category.all.reverse_order
      render :new
    end
  end

  def create_item
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cd_path(@cart_item.cd)
    else
      render :show
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
    params.require(:cd).permit(:cd_title, :cd_image, :stock, :cd_profile, :price, :artist_id, :label_id, :category_id,
      disc_number_attributes: [:id, :cd_id, :disc_number, :_destroy, songs_attributes: [:id, :song_order, :song_name, :_destroy]])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :cd_id, :user_id, :cart_id)
  end
end