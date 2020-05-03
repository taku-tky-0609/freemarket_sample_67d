class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.item_images.build
  end
  
  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    unless @item.valid?
      flash.now[:alert] = @item.errors.full_messages
      # helper Form
      render :new and return
    end

    redirect_to root_path
  end
  
  def show
    @items = Item.includes(:user).order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :delivery_area_id, :estimated_delivery_id, item_images_attributes: [:item_id, :image]).merge(user_id: current_user.id) 
  end
end
