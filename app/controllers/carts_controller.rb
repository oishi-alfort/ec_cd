class CartsController < ApplicationController
  before_action :current_cart, only: [:cart]

  def cart
    @cart = current_cart
  end

end