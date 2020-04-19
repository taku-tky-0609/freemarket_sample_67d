class CreditController < ApplicationController

  def new
    card = Card.where(user: current_user.id) #登録するカード所有者を見つけて、Cardに代入
    redirect_to card_path(current_user.id) if card.exits?
  end

  def pay
    payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to new_card_path #pathによっては変更の可能性あり
    else
      customer = Payjp::Customer.create(card: params['payjp-token'], metadata: {user_id: current_user.id})
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to pay_cards_path
      end
    end
  end
end
