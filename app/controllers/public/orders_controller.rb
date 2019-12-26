class Public::OrdersController < Public::ApplicationController
before_action :authenticate_user!

  def index
    @user = current_user
    @user = @user.orders.order("id DESC")
    @orders = @user.page(params[:page]).per(10)
    @tax = 1.1

  end

  def confirm
    @user = current_user
    @user_cart = @user.cart_cds
    @tax = 1.1
  end


  def new
    if params[:add].blank? or params[:pay].blank?
        if params[:add].blank? and params[:pay].blank?
          flash[:noadd] = '配送先を選択して下さい'
          flash[:nopay] = '支払い方法を選択して下さい'
          redirect_to public_orders_confirm_path
        elsif params[:add] == "2" and (params[:add1].blank? or params[:add2].blank? or params[:add3].blank? or params[:add4].blank?) and params[:pay].blank?
          flash[:nopay] = '支払い方法を選択して下さい'
          flash[:noadd] = '配送先情報を入力して下さい'
          redirect_to public_orders_confirm_path
        elsif params[:pay].blank?
          flash[:nopay] = '支払い方法を選択して下さい'
          redirect_to public_orders_confirm_path
        elsif params[:add].blank?
          flash[:noadd] = '配送先を選択して下さい'
          redirect_to public_orders_confirm_path
        end
    elsif params[:add] == "2" and (params[:add1].blank? or params[:add2].blank? or params[:add3].blank? or params[:add4].blank?)
      flash[:noadd] = '配送先情報を入力して下さい'
      redirect_to public_orders_confirm_path
    else



    @cds = Cd.find(params[:count1])
    @cdcounts = params[:count]
    @cdids = params[:count1]
    @tax = 1.1
    @deliver = 500
    @user = current_user
    @user_cart = @user.cart_cds.all
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

    @count = 0
    @cd_ids.each do |f|
      cd = Cd.find(f)
      if cd.stock < @cd_counts[@count]
        @user.cart_cds.each do |i|
          if i.cd == cd
            i.destroy
            @bbb = "F"
          end
        end
      end
      @count += 1
    end

    if @bbb == "F"
      flash[:notice] = '商品の在庫が足りませんでした'
      redirect_to root_path
    end

    unless order.save
      redirect_to root_path
    else
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
        cd_id.stock -= @cd_counts[@count]
        cd_id.save
        @count += 1
      end

    flash[:buy] = 'ご購入ありがとうございました。
    またのご利用を心よりお待ちしております。'
    redirect_to public_orders_path
    end
  end

  def finish
  end

  def show
  end

end
