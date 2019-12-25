class Admin::OrdersController < Admin::ApplicationController

  def index
    @orders = Order.all
    @orders = @orders.order("deliver_status")
    @order = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @tax = 1.1
  end

  def update
    @order = Order.find(params[:id])
    @order.deliver_status = 2
    @order.save
    redirect_to admin_orders_path
  end


private

    def order_params
     params.require(:order).permit(:id)
    end

    def order_status_deliver_params
      params.require(:deliver_status).permit(1,2)
    end
end
