class Public::InterestsController < Public::ApplicationController
  before_action :authenticate_user!

  def index
    @interests = Interest.page(params[:page]).per(10)
    @cart_cd_new = CartCd.new
  end

  def create
  	@interest = current_user.interests.create(cd_id: params[:cd_id])
  	if  @interest.save
  		redirect_to public_interests_path
  	else
  		redirect_to root_path
    end
   end

  def destroy
    @interest = Interest.find(params[:id])
    if @interest.destroy
      flash[:notice] = "気になるCDを削除しました。"
      redirect_to public_user_path
    else
      render :index
    end
  end
  private

    def review_params
     params.require(:review).permit(:id)
    end

end



