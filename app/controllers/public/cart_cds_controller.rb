class Public::CartCdsController < Public::ApplicationController
  before_action :authenticate_user!

  def create
    @aaa = Cd.find(params[:cd_id])#cd_idを持ってくる
    if @aaa.stock == 0#cd_idのstockを持って持ってきてもしstockが０の時にrootに飛ばす
       redirect_to root_path
    elsif
      @aaa.status == "販売停止中"
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
