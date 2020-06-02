Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :categories 

  root 'items#index'
  

  resources :items do
    member do
      post 'pay'            #id'=>   'items#pay', as: 'pay'  httpメソッドはpostなので注意
      get  'done'           #=>      'items#done', as: 'done'
      get "purchase_index"
      get "purchase_edit"
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'myList', to: 'items#myList'
    end
  end

  
  


  resources :purchases  do
    member do
      get "purchase_index"
      get "purchase_confirmation"
      post "purchase"
      get "purchase_edit"
    end
  end
    
      
  resources :users, only: :show
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'myList', to: 'items#myList'
    end
  end
    
  post "logout" => "users#logout"
  resources :credit_cards, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end

end

