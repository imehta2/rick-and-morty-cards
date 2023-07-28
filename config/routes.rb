# config/routes.rb

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  get 'contact_us/show'
  get 'about_us/show'



  # Defines the root path route ("/")
  root to: 'home#index'

  # Define routes for the homepage (Rick and Morty Collectibles)
  get 'home/index'

  # Define routes for the products page
  resources :products, only: [:index]

  # Define routes for about us and contact us pages if you have them
  get 'about_us', to: 'about_us#show'
  get 'contact_us', to: 'contact_us#show'

  get '/cart', to: 'products#cart', as: 'cart'
  post '/add_to_cart/:character_id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete '/remove_path/:character_id', to: 'products#remove_from_cart', as: 'remove_from_cart'

end
