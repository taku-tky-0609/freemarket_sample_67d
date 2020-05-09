class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    # @item.item_images.build
    @item.build_brand
    # @item.brand.build
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end


  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    unless @item.valid?
      # flash.now[:alert] = @item.errors.full_messages
      # helper Form
      render :new and return
    end
    @item.save
    redirect_to root_path
  end
  
  def show
    @item = Item.includes(:user, :category)
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, brand_attributes: [:name], images: []).merge(user_id: current_user.id) 
  end
end
