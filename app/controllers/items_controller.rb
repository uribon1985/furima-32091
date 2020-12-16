class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:update, :show, :edit]

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


  #def destroy
    #@item = Item.find(params[:id])
    #item.destroy
    #redirect_to root_path
  #end

  private
  def item_params
    params.require(:item).permit(:image, :name, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :estimated_shipping_id, :product_description, :price).merge(user_id: current_user.id) #: params[:])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
