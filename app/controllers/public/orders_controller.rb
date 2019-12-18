class Public::OrdersController < Public::ApplicationController
  def index
  end

  def show
  end

  def confirm
    @user = current_user
    @user_cart = @user.cart_cds
    @tax = 1.1
    # if @user_cart.update(cart_params)
    # else
    #   render :confirm
    # end
  end

  def new
    @order = Order.new
    @user = current_user
    case params[:add]
    when "1"
      @add1 = @user.postalcode
      @add2 = @user.address
      @add3 = @user.lastname
      @add4 = @user.firstname
    when "2"
      @add1 = params[:add1]
      @add2 = params[:add2]
      @add3 = params[:add3]
      @add4 = params[:add4]
    end

    case params[:pay]
    when "a"
      @payment = "クレジット"
    when "b"
      @payment = "代金引き換え"
    when "c"
      @payment = "銀行振り込み"
    end
    @buy_count = params[:buy_count]
    @buy_cd = params[:buy_cd]


  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.save
    redirect_to public_orders_finish_path
  end

  def finish
  end

private

  def cart_params
    params.require(:cart_cd).permit(:user_id, :cd_id, :cart_count)
  end

  def order_params
    params.require(:order).permit(:payment, :order_count)
  end

  def address_params
    params.require(:address).permit(:add_postalcode, :add_address, :add_lastname, :add_firstname)
  end

  def cart_params
    params.require(:cart_cd).permit(:cart_count, :cd_id)
  end
end
