class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item, only: [:index, :create]

  def index
    #binding.pry
    @order = OrderAddress.new
    if current_user.id == @item.user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
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
