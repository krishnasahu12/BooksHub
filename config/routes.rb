Rails.application.routes.draw do

  get 'cart_items/index'
  get 'carts/index'
  get 'books/index'
  get 'users/index'
  get 'profiles/index'
  root 'books#index'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  
  resources :users
  resources :profiles
  resources :books
  resources :address
  resources :order
  resources :cart_items do
    member do
      post 'cart'
      get 'increase'
      get 'decrease'
    end
  end


  get '/show_books/:course', to: 'books#new_buy'
  get '/new/book', to: 'books#new_book'
  get '/new/buy', to: 'books#new_buy'
  

end
