class CartsController < ApplicationController
  before_action :current_cart, only: [:cart]
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def cart
    @cart_items = CartItem.all
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(cd_id: params[:cd_id])
    end
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.cd_id = params[:format].to_i
    @cart_item.user_id = current_user.id
    @cart_item.save


    #redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private


  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(cd_id: params[:cd_id])
  end
end