class UsersController < ApplicationController
  
  def index
   @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_user_check_url
    else
      render :new
    end
  end
  
  def user_check
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :size, :memo)
    end
end
