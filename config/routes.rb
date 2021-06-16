Rails.application.routes.draw do
  #Root
  root to: "home#index"
  #Comments
  resources :comments
  #Category
  resources :categories
  #Posts
  resources :posts
  #Oauth Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
