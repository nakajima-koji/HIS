class RequestsController < ApplicationController
  before_action :logged_in_user?, only: [:index]
  before_action :admin_user, only: [:index]
  
  def index
    @user = User.find(params[:user_id])
    @requests = @user.request.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @user = User.find(1)
    @request = @user.request.build
  end
  
  def create
    @user = User.find(1)
    @request = @user.request.new(request_params)
    if @request.save
     RelationshipMailer.request_creating(@user,@request).deliver
      redirect_to users_user_check_url
    else
      render :new
    end
  end
  
  def pay
    @user = User.find(1)
    @request = @user.request.build
    Payjp.api_key = '秘密キー'
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
  
  private
    def request_params
      params.require(:request).permit(:name, :email, :memo, :size, :address)
    end
end
