class Public::UsersController < Public::ApplicationController
  before_action :user_find, only: [:show, :edit, :update, :destroy, :out]

  def show
    @carts = CartCd.all

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
