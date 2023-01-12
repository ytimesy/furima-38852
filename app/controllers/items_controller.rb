class ItemsController < ApplicationController
  before_action :move_to_users_new, except: [:index]


  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :deliveryfee_type_id, :prefecture_id, :delivery_when_id, :itemfee, :image).merge(user_id: current_user.id)
  end

  def move_to_users_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
