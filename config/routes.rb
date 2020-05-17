Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    # post 'card',to: 'users/registrations#create_credit_cards' ← 追加実装
  root 'items#index'
  get '/items/:item_id/purchase', to: 'items#purchase'
  resources :items do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    get 'myList', to: 'items#myList'
  end
  end

  resources :items do
    collection do
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      post 'pay/:id'=>   'items#pay', as: 'pay'#httpメソッドはpostなので注意
      get  'done'=>      'items#done', as: 'done'
    end
  end

  resources :users, only: :show
  
   
  post "logout" => "users#logout"
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end

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


