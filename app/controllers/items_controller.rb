class ItemsController < ApplicationController

  def index
  end
  
  def new
    @item = Item.new
    @item.item_images.build
    @item.build_brand
  end
  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def create
    @item = Item.new(item_params)
    unless @item.valid?
      render :new and return
    end
    @item.save
    redirect_to root_path
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, brand_attributes: [:name], item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
