Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'products/search'
    end
  end
  get 'products/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get 'products/search', to: 'products#search'
    end
  end
end
