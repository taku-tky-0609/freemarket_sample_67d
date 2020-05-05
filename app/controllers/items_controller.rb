class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new
    # @item.item_images.build
    # @item.build_brand
    @categori_parent_array = ["---"]
    @categori_parent_array = Categori.where(ancestry: nil)
  end

  def get_category_children
    @categori_children = Categori.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @categori_grandchildren = Categoi.find(params[:child_id]).children
  end


  def create
    # Item.create(item_params)
    @item = Item.new(item_params)
    unless @item.valid?
      flash.now[:alert] = @item.errors.full_messages
      # helper Form
      render :new and return
    end
    @item.save
    redirect_to root_path
  end
  
  def show
    @item = Item.includes(:user, :categori)
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :delivery_area_id, :estimated_delivery_id, item_images_attributes: [:item_id, :image]).merge(user_id: current_user.id) 
  end
end
