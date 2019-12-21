class Public::UsersController < Public::ApplicationController
  before_action :authenticate_user!#これでログインしていない人がURLを指定しなかった場合ログインのページに強制的に飛ばす
  before_action :user_find, only: [:show, :edit, :update, :destroy, :out]
  before_action :current_user, only: [:show, :update , :destroy]

  def show
    @carts = CartCd.all
    @users = User.page(params[:page]).per(10)
    @user = current_user

  end

  def edit
  end

  def update
    if
      @user.update(user_params)
      redirect_to public_user_path(@user.id), flash:{success: "You have updated user successfully."}
   else
      render  action: :edit
   end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "退会しました。"
      redirect_to root_path
    else
      render :out
    end
  end

  def out
  end


  private

  def user_params
    params.require(:user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phone, :email, :profile_image)
  end

  def user_find
    @user = User.find(params[:id])
  end

end
