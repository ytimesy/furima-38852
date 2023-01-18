class ItemsController < ApplicationController
  before_action :authenticate_user! ,except: [ :index, :show ]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_purchase, only: [ :index, :show ]
  before_action :move_to_root_check, only:[ :edit, :destroy ]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :deliveryfee_type_id, :prefecture_id, :delivery_when_id, :itemfee, :image).merge(user_id: current_user.id)
  end

  def move_to_root_check
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_purchase
    @purchases = Purchase.all
  end

end
