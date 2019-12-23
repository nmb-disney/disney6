class Admin::OrdersController < Admin::ApplicationController

  def index
    @orders = Order.all
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @tax = 1.1
  end

  def edit
  end


private

    def order_params
     params.require(:order).permit(:id)
    end
end
