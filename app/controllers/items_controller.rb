class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]     
  before_action :set_item, only: [:update, :show, :edit, :destroy]

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

  def show
  end

  def edit
    if  current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    #@item = Item.new(item_params)
   if current_user.id == @item.user.id
       @item.destroy
       redirect_to root_path
   end
  end
  

  private
  def item_params
    params.require(:item).permit(:image, :name, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_id, :product_description, :price).merge(user_id: current_user.id) 
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
