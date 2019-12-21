class Public::CartCdsController < Public::ApplicationController
  before_action :authenticate_user!

  def create
  	@cartcd = current_user.cart_cds.new(cart_cd_params)
    @cartcd.cd_id = params[:cd_id]
  	if  @cartcd.save!
  		redirect_to public_user_path(current_user.id)
  	else
  		redirect_to root_path
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
