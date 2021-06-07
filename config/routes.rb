Rails.application.routes.draw do
  resources :products
  devise_for :users

  namespace :admin do
    resources :products
  end

  root 'index#main'
end
