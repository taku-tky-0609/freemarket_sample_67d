class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user, :category).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.item_images.build
    # @item.item_images.build
    @item.build_brand
    # @item.brand.build
    # @category_parent_array = ["---"]
    # # @category_parent_array = Category.where(ancestry: nil)
    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name

      # def get_category_children
      #   @category_children = Category.find(params[:parent_id]).children
      # end
      
      # def get_category_grandchildren
      #   @category_grandchildren = Category.find(params[:child_id]).children
      # end
      # @grandchildren = get_category_grandchildren.find_by
      # end
      
    end
    def get_category_children
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
      # binding.pry
    end
  
  # def get_category_children
  #   # @category_children = Category.find(params[:item_category_id])
  #   # @category_children = Category.find_by(name: params[:item_category_id])
  #   @category_children = Category.find(params[:parent_id]).children
  # end
    
  
  # def get_category_grandchildren
  #   @category_grandchildren = Category.find(params[:child_id]).children
  # end


  def create
    binding.pry
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
  
  def myList
    # @items = Item.includes(:user, :category).order("created_at DESC")
    @items = Item.where(user_id: current_user.id)
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    
    @item.buyer_id = 0
    @item.buyer_id = @item.buyer_id + current_user.id
    @item.save

    redirect_to root_path
    
  end

  def show
    @item = Item.includes(:user, :category)
    @item = Item.find(params[:id])
  end
  
  def purchase
    
  end
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
    params.require(:item).permit(:item_name, :price, :category_id, :status_id, :size, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, brand_attributes: [:name], item_images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def images_params
    strong_param = params.require(:item).permit(images: [])
    if strong_param[:images].present?
      strong_param[:images].each do |image|
        image.original_filename = URI.encode(image.original_filename)
      end
    end
    strong_param[:images]
  end



end
