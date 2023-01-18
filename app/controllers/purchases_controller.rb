class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:id])  #商品情報を取得@item
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:format])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postcode, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end