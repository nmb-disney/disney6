class Public::CartCdsController < Public::ApplicationController
  before_action :authenticate_user!

  def create
    @aaa = Cd.find(params[:cd_id])
    if @aaa.stock == 0
        redirect_to root_path
    else
      cartnew = CartCd.new(cart_cd_params)
      cartnew.user_id = current_user.id
      cartnew.cd_id = params[:cd_id]
      cartnew.cart_count
      cartnew.save!
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
