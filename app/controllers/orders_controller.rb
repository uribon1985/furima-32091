class OrdersController < ApplicationController
  before_action :authenticate_user! 

  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :address, :building_name, :phone_number, :municipality).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
