class PurchaseController < ApplicationController
    require 'payjp'#Payjpの読み込み
    before_action :set_card, :set_item, :purchase_index
  
    def index
      if @card.blank?
        #登録された情報がない場合にカード登録画面に移動
        # redirect_to new_credit_card_path
      else
        Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
        #保管した顧客IDでpayjpから情報取得
        customer = Payjp::Customer.retrieve(@card.customer_id) 
        #カード情報表示のためインスタンス変数に代入
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    end
  
    private
  
    def set_card
      @card = CreditCard.find_by(user_id: current_user.id)
    end
  
    def set_item
      @item = Item.find(params[:item_id])
    end
  

end
