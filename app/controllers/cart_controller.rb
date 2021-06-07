class CartController < ApplicationController
  before_action :authenticate_user!, :current_cart

  def index
    product_ids = @current_cart&.split(' ')
    @products = Product.where(id: product_ids)
  end

  def update
    if @current_cart.blank?
      $redis.set("#{current_user.id}", "#{params[:id]}")
    else
      $redis.set("#{current_user.id}", @current_cart + " #{params[:id]}")
    end
  end

  private
  def current_cart
    @current_cart = $redis.get("#{current_user.id}")
  end
end
