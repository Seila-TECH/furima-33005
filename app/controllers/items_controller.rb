class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :summary_confirmation, only: [:edit, :update]

  def index
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item.save
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :item_profile, :category_id, :item_status_id, :shipping_fee_id, :shipping_erea_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def summary_confirmation
    @item = Item.find(params[:id])
  end
end
