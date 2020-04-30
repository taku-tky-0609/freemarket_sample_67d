class ItemsController < ApplicationController
  def index
  end

  def new
    @item= Item.new
  end

  def create
    Item.create(item_params)
    # @item = Example.create(item_params)
    binding.pry
    redirect_to root_path
    # logger.debug @example.errors.inspect
  end
  
  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :delivery_area_id, :estimated_delivery_id).merge(user_id: current_user.id) 
  end
end
