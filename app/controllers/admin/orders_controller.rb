class Admin::OrdersController < AdminController
  before_action :set_order, only: %i[ show destroy ]

  # GET /orders
  def index
    @orders = Order.includes(:user).all
  end

  # GET /orders/1
  def show; end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to admin_orders_url, notice: "Order was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {})
    end
end
