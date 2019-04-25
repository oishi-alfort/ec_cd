class ApplicationController < ActionController::Base
     
  before_action :configure_permitted_parameters, if: :devise_controller?

     # アドミンとユーザーで見れるページを分ける
   def  check_admin
     if current_user.id != 7
         redirect_to root_path
     end
   end
  
   def after_sign_in_path_for(resource)
     root_path(current_user)
   end
   
   def after_sign_up_path_for(resource)
     "/users/#{current_user.id}"
   end
   
   def after_sign_out_path_for(resource)
     root_path # ログアウト後に遷移するpathを設定
   end
   
  protected
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username,:password])
   end
  
  
	before_action :set_search

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

	private
  def search_params
    params.require(:q).permit(:cd_title_cont)
  end
  
end
