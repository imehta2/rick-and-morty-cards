# config/routes.rb

Rails.application.routes.draw do
  namespace :admin do
    get 'about_us/edit'
    get 'about_us/update'
  end
  get 'contact_us/show'
  get 'about_us/show'
  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Defines the root path route ("/")
  root to: 'home#index'

  # Define routes for the homepage (Rick and Morty Collectibles)
  get 'home/index'

  # Define routes for the products page
  resources :products, only: [:index]

  # Define routes for about us and contact us pages if you have them
  get 'about_us', to: 'about_us#show'
  get 'contact_us', to: 'contact_us#show'
end
