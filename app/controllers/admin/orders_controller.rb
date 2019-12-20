class Admin::OrdersController < Admin::ApplicationController

  def index
  	@orders = Order.page(params[:page]).per(10)
  end

  def show
  end


private

    def order_params
     params.require(:order).permit(:id)
    end
end
