class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
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
    params.require(:item).permit(:image, :name, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_id, :product_description, :price).merge(user_id: current_user.id) #: params[:])
  end
end
