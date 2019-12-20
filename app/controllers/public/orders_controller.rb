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
    @user = current_user
    @cd_counts = params[:order_count].split
    @cd_counts.map!(&:to_i)
    @cd_ids = params[:cds].split
    @cd_ids.map!(&:to_i)

    order = Order.new
    order.user_id = @user.id
    order.postalcode = params[:postalcode]
    order.address = params[:address]
    order.firstname = params[:firstname]
    order.lastname = params[:lastname]
    order.payment = params[:payment]
    @cdstax = params[:cdstax]
    order.tax = @cdstax.to_i
    @orderfee = params[:deliver_fee]
    order.deliver_fee = @orderfee.to_i
    @ordertotal = params[:total]
    order.total =@ordertotal.to_i
    @status = params[:deliver_status]
    order.deliver_status = @status.to_i
    order.order_count = @cd_counts.sum
    order.save

    @count = 0
      @cd_ids.each do |cdids|
        order_cd = OrderCd.new
        order_cd.order_id = order.id
        order_cd.cd_id = cdids
        order_cd.order_cd_count = @cd_counts[@count]
        order_cd.save
        @count += 1
      end

    address = Address.new
    address.user_id = @user.id
    address.add_postalcode = params[:postalcode]
    address.add_address = params[:address]
    address.add_lastname = params[:lastname]
    address.add_firstname = params[:firstname]
    address.save

    cart = @user.cart_cds
      cart.each do |cart_d|
        cart_d.destroy
      end

    @count = 0
      @cd_ids.each do |stock|
        cd_id = Cd.find(stock)
        @stock = cd_id.stock
                binding.pry
        @stock - @cd_counts[@count]

        cd_id.update
        @count += 1
      end
    redirect_to public_orders_path
    end
  # else
  #   redirect_to new_public_order_path
  # end

  def finish
  end

  def show
  end

end
