class CardsController < ApplicationController

  require "payjp" #payjpの呼び出し

  def new
    card = Card.where(user_id: current_user.id) #cardテーブル上でid検索
    redirect_to action: "show" if card.exists? #existsはデータが存在するか検索
  end

  def pay #payjpとCardのデータベース作成を実施します。
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY #秘密鍵との紐付け
    Payjp.api_key = "sk_test_05e67d2d7366d55decab8c22" #秘密鍵との紐付け
    if params['payjp-token'].blank? # jsで作成したpayjpTokenがちゃんと入っているか？
      redirect_to action: "new" # トークンが空なら戻す
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp.api_key = "sk_test_05e67d2d7366d55decab8c22"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end