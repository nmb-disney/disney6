class Public::OrdersController < Public::ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def confirm
    @user = current_user
    @user_cart = @user.cart_cds.all
    @tax = 1.1
    # if @user_cart.update(cart_params)
    # else
    #   render :confirm
    # end
  end


  def new
    @cds = Cd.find(params[:count1])
    @cdcounts = params[:count]
    @cdids = params[:count1]
    @tax = 1.1
    @deliver = 500
    @user = current_user
    @user_cart = @user.cart_cds.all
    @tax = 1.1
    @order = Order.new
    @totalprice = 0
    @count = 0
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
  end

  def create
    @cdcount = params[:cdcount]
    @user = current_user

    order = Order.new
    order.user_id = current_user.id
    order.postalcode = params[:postalcode]
    order.address = params[:address]
    order.firstname = params[:firstname]
    order.lastname = params[:lastname]
    order.payment = params[:payment]
    order.deliver_fee = params[:deliver_fee]
    order.total = params[:total]
    order.deliver_status = params[:deliver_status]
      @cd_counts = params[:order_count].split
      @cd_counts.map!(&:to_i)
    order.order_count = @cd_counts.sum
# unless @order.save
#   redirect_to new_public_order_path
# else

    order_cd = OrderCd.new
    order_cd.order_id = order.id
    @cd_ids = params[:cds].split
    @cd_ids.map!(&:to_i)
    @count = 0
      @cd_ids.each do |cartcd|
        order_cd.cd_id = @cd_ids[@count]
        order_cd.order_cd_count = @cd_counts[@count]
      # order_cd.save
        @count += 1
      end

    address = Address.new
    address.user_id = current_user.id
    address.add_postalcode = params[:postalcode]
    address.add_address = params[:address]
    address.add_lastname = params[:lastname]
    address.add_firstname = params[:firstname]

    # cart = Cart.find(params[])
    # .each do |cart|
    # #   cart.destroy
    # end
    redirect_to public_orders_path(order.id)
  end

  def finish
  end

  def show
  end


private

  def order_params
    params.require(:order).permit(:order_count)
  end

  def cart_params
    params.require(:cart_cd).permit(:user_id, :cd_id, :cart_count)
  end

  def address_params
    params.require(:address).permit(:add_postalcode, :add_address, :add_lastname, :add_firstname)
  end

  def cart_params
    params.require(:cart_cd).permit(:cart_count, :cd_id)
  end
end
