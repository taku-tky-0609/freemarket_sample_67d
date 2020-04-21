Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    post 'card',to: 'users/registrations#create_credit_cards'
  root 'items#index'
  root to: 'home#index'
  resources :users, only: :show
  
  # resources :signup do
  #   collection do
  #     get 'step1'
  #     post 'step2'
  #     get 'step3'
  #     get 'step4'
  #     get 'done' # 登録完了後のページ
  #   end
  # end
  # 
  # get 'addresses/show'
  # get 'brands/show'
  # get 'credit_cards/index'
  # get 'categories/index'
  # get 'items_comments/create'
  end
end

