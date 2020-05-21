class PurchasesController < ApplicationController
  before_action :logged_in_user?, only: [:index]
  before_action :admin_user, only: [:index]
  
  def index
    @user = User.find(1)
    @purchases = @user.purchase.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @user = User.find(1)
    @purchase = @user.purchase.build
  end
  
  def create
    @user = User.find(1)
    @purchase = @user.purchase.new(purchase_params)
    if @purchase.save
      redirect_to users_user_check_url
    else
      render :new
    end
  end
  
  def show
    @user = User.find(1)
    @purchase = @user.purchase.find(params[:id])
  end
  
  def pay
    @user = User.find(1)
    @purchase = @user.purchase.build
    Payjp.api_key = '秘密キー'
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end
  
  private
    def purchase_params
      params.require(:purchase).permit(:name, :email, :memo, :size, :address, :number)
    end
end
