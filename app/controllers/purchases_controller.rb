class PurchasesController < ApplicationController
  before_action :authenticate_user! ,only: [ :index ]
  before_action :set_params, only: [ :index, :create ]
  before_action :move_to_root_check, only:[ :index ]
  
  def index
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    @item = Item.find(params[:id])
  end

  def purchase_params
    params.require(:purchase_delivery).permit(:postcode, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_root_check
    #Sold Out商品は購入できない
    if user_signed_in?
      purchases = Purchase.all
      purchases.each do |purchase|
        if purchase.item_id == params[:id].to_i
          redirect_to root_path
          return
        end
      end

      #自身が出品した商品は購入できない
      item = Item.find(params[:id])
      if item.user == current_user
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.itemfee,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end