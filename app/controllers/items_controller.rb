class ItemsController < ApplicationController
  def index
  end
  
  def myList
    # @items = Item.includes(:user, :category).order("created_at DESC")
    @items = Item.where(user_id: current_user.id)
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を引っ張ってくる
      :customer => current_user.credit_card.customer_id,  #顧客ID
      :currency => 'jpy',              #日本円
    )
    # charge = Payjp::Charge.create(
    # amount: @item.price,
    # credit_card: params['payjp-token'],
    # currency: 'jpy'
    # )
    
    @item.buyer_id = 0
    @item.buyer_id = @item.buyer_id + current_user.id
    @item.save

    redirect_to purchase_edit_item_path
    
  end

  def show
    @item = Item.includes(:user, :category)
    @item = Item.find(params[:id])
  end
  
  def purchase_index
    @item = Item.find(params[:id])
  end

  def purchase_edit
    @item = Item.find(params[:id])
  end


  # def purchase
  #   @item = Item.includes(:user, :category)
  #   # @item = Item.find(params[:id])
  # end
 
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
   end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, brand_attributes: [:name], images: []).merge(user_id: current_user.id) 
  end
end
