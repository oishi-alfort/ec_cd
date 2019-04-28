class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, only: [:index]

  def index
    @users = User.all
    
  end


  def show
   @user= current_user
   @favorites = Favorite.all
  end

   def create
    
   end
   
   def edit
       @user =current_user
   end
   
   def updated
       @user=User.find(params[:id])
        if @user.update(cd_params)
          flash[:notice] = "更新しました!"
          redirect_to root_path
        else
          flash[:notice] = "Error!"
          render :edit
        end
   end       
 
 def destroy
     @user= User.find(params[:id])
     if @user.destroy
         redirect_to users_path
     end
 end
   private
  def user_params
    params.require(:user).permit(:user_name,:first_name,:last_name,:first_name_kana,:last_name_kana,:post_code,:phone_number,:adress,:password )
  end

end


  