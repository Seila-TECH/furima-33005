class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase


  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def create
    @item = Item.find(params[:item_id]) 
    @form = Form.new(purchase_params)
    
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:form).permit(:postal, :shipping_erea_id, :adress, :adress_number, :telphone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency: 'jpy'                 
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id]) 
    if @item.purchase.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
