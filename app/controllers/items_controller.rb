class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.new
    @items = Item.all.includes(:user).order("created_at DESC")
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
    params.require(:item).permit(:item_name, :item_profile, :category_id, :item_status_id, :shipping_fee_id, :shipping_erea_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

end
