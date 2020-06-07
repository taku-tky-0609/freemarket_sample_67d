class CreditCardsController < ApplicationController
  before_action :header_category

  require "payjp"

  def new
    card = CreditCard.find_by(user_id: current_user.id)
    redirect_to action: "show" unless card.nil?
  end

  def pay
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new" 
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = CreditCard.find_by(user_id: current_user.id)
    if card.nil?
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show 
    card = CreditCard.find_by(user_id: current_user.id)
    if card.nil?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_credit_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
