class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	before_action :set_search
	helper_method :current_cart

	def after_sign_in_path_for(resource)
		cds_path
	end

	def after_sign_out_path_for(resource)
		cds_path
	end
	
	def check_admin
	    if current_user.id != 7
         redirect_to root_path
        end
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

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:password,:email,:adress])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username,:password])
  end
  

end
