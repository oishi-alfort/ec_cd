class SearchesController < ApplicationController

  def result
  	@search = Cd.ransack(params[:q])
    @search_cds = @search.result(params[:q])
    @cart_item = CartItem.new
  end

  private
  def search_params
    params.require(:q).permit(:cd_title_cont)
  end
end
