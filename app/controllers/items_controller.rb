class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :pay, :purchase_index, :purchase_edit, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user, :category).order("created_at DESC")
  end
  
  def myList
   
    @items = Item.where(user_id: current_user.id)
  end

  def pay
  
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を引っ張ってくる
      :customer => current_user.credit_card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    
     @item.buyer_id = 0
      @item.buyer_id = @item.buyer_id + current_user.id
      if @item.save
        redirect_to purchase_edit_item_path

      else redirect_to new_credit_card_path

    end
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
    if @item.save
      redirect_to root_path
    else
      @item.item_images.build
      @item.build_brand
      render action: :new
    end
  end

  

  def show
   
  end
  
  def purchase_index
   
  end

  def purchase_edit
   
  end


 
 
  def edit
    
  end

  def myList
    @items = current_user.items
  end


  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path notice: '削除に成功しました。'
    else
      render :new, alert: '保存に失敗しました。'
    end
  end
  

  private

  def set_item
    @item = Item.includes(:user, :category).find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, brand_attributes: [:name], item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
