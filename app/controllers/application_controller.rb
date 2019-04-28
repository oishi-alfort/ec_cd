class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
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
		if user_signed_in? && Cart.find_by(user_id: current_user)
			# if it was an user who already has a cart
			@u_cart = Cart.find_by(user_id: current_user)
			if session[:cart_id]
				if Cart.find(session[:cart_id]).present? && @s_cart != @u_cart
					@s_cart = Cart.find(session[:cart_id])
					if @s_cart.cart_items.present?
						@s_cart.cart_items.each do|i|
							if @u_cart.cart_items.find_by(cd_id: i.cd_id)
								u_item = @u_cart.cart_items.find_by(cd_id: i.cd_id)
								u_item.quantity += i.quantity
								u_item.save
								i.destroy
							else
								new_u_item = @u_cart.cart_items.new(cd_id: i.cd_id, quantity: i.quantity)
								new_u_item.save
								i.destroy
							end
						end
					end
				end
			end
			return Cart.find_by(user_id: current_user)
				# if user's cart found, return it
		else
			# not signed in guest or signed in user who doesn't have u_cart
			if session[:cart_id]
			   @s_cart = Cart.find(session[:cart_id])
			   # if 1) guest's session-cart found
			   if user_signed_in?
			   	@s_cart.user_id = current_user
			   	@s_cart.save
			   end
			   # if 2) user's cart created
			   return @s_cart
			   # if 1) or 2), return it.
			else
				@s_cart = Cart.create
				session[:cart_id] = @s_cart.id
				return @s_cart
				# if guest's session-cart created, return it.
			end
		end
	end


	def  check_admin
    #   ログイン済みかどうかの判断
     if current_user.admin != true
         redirect_to root_path
     end
   	end

protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number, :admin])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number])
        devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :phone_number, :admin])
    end

private
def search_params
	params.require(:q).permit(:cd_title_cont)
end

  def cart_params
  	params.require(:cart).permit(:user_id)
  end

end