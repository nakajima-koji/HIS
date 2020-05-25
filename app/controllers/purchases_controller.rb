class PurchasesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update]
  before_action :logged_in_user?, only: [:index, :show, :edit, :update]
  before_action :admin_user, only: [:index,:show, :edit, :update]
  
  def index
    @purchases = @user.purchase.paginate(page: params[:page], per_page: 20)
  end
  
  def new
    @purchase = @user.purchase.build
  end
  
  def create
    @purchase = @user.purchase.new(purchase_params)
    if @purchase.save
      redirect_to users_user_check_url
    else
      render :new
    end
  end
  
  def show
    @purchase = @user.purchase.find(params[:id])
  end
  
  def edit
    @purchase = @user.purchase.find(params[:id])
  end
  
  def update
    @purchase = @user.purchase.find(params[:id])
    if @purchase.update_attributes(purchase_params)
      redirect_to user_purchase_url @purchase
      flash[:success] = "更新しました。"
    else
      render :edit
    end
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
    
    def set_user
     @user = User.find(1)
    end
end
