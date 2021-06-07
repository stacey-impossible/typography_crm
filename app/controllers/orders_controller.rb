class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_cart

  # POST /orders
  def create
    product_ids = @current_cart&.split(' ')
  
    if Order.create(user: current_user, product_ids: product_ids)
      $redis.set("#{current_user.id}", nil)
      redirect_to '/', notice: "Order was successfully created."
    else
      redirect_to cart_index_path, status: :unprocessable_entity
    end
  end

  private
  def current_cart
    @current_cart = $redis.get("#{current_user.id}")
  end
end
