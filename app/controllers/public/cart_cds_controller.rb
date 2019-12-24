class Public::CartCdsController < Public::ApplicationController
  before_action :authenticate_user!

  def create
    @aaa = Cd.find(params[:cd_id])#cd_idを持ってくる
    @user_cart = current_user.cart_cds

    @user_cart.each do |cart_cd|
      if cart_cd.cd_id == params[:cd_id].to_i
        @bbb = "X"
      else
      end
    end

    if @bbb =="X"
      flash[:notice] = "既にカートに入っています。"
      redirect_to root_path

    elsif @aaa.stock == 0#cd_idのstockを持って持ってきてもしstockが０の時にrootに飛ばす
       flash[:notice] = "在庫がありません。入荷までお待ちください。"
       redirect_to root_path
    elsif
      @aaa.status == "販売停止中"
      flash[:notice] = "申し訳ありません。販売停止中です。"
      redirect_to root_path



    else#ifじゃないとき
       cartnew = CartCd.new(cart_cd_params)#idを持ってくる
       cartnew.user_id = current_user.id##ログインしているユーザー
       cartnew.cd_id = params[:cd_id]##カートに入るのはcd_idです
       cartnew.cart_count#cd_idの中にある中にある枚数を持ってくる
       cartnew.save#セーブする
       redirect_to public_user_path(current_user.id)
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @carts = CartCd.find(params[:id])
    if @carts.destroy
      flash[:notice] = "Cart was successfully destroyed."
      redirect_to public_user_path(current_user.id)
    end
  end

  private

  def cart_cd_params
     params.require(:cart_cd).permit(:user_id, :cd_id, :cart_count)
  end
end
