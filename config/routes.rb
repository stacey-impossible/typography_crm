Rails.application.routes.draw do
  resources :cart, only: [:index, :update]
  resources :orders, only: :create
  resources :products, only: [:index, :show]
  devise_for :users

  namespace :admin do
    get '/', to: 'index#main'
    resources :products
    resources :orders, only: [:index, :show, :destroy]
  end

  root 'index#main'
end
