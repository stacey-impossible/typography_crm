class OrdersController < ApplicationController
  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to '/', notice: "Order was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end
end
