class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	before_action :set_search
	helper_method :current_cart

	def after_sign_in_path_for(resource)
		cds_path
	end

	def after_sign_out_path_for(resource)
		cds_path
	end

	def set_search
		@search = Cd.ransack(params[:q])
		@search_cds = @search.result.includes(:artist)
	end


	def current_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		else
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end
	end

private
def search_params
	params.require(:q).permit(:cd_title_cont)
end

end
