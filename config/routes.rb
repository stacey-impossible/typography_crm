# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cart, only: %i[index update]
  resources :orders, only: :create
  resources :products, only: %i[index show]
  devise_for :users

  namespace :admin do
    get '/', to: 'index#main'
    resources :products
    resources :orders, only: %i[index show destroy]
  end

  root 'index#main'
end
