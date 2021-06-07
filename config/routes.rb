Rails.application.routes.draw do
  resources :orders, only: :create
  resources :products, only: [:index, :show]
  devise_for :users

  namespace :admin do
    resources :products
    resources :orders, only: [:index, :show, :destroy]
  end

  root 'index#main'
end
