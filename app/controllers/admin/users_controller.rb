class Admin::UsersController < Admin::ApplicationController
  before_action :user_find, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page]).per(10)

  end

  def show
    @users = User.page(params[:page]).per(10)
  end

  def edit
    @user_order = @user.orders
  end

  def update
  if
      @user.update(user_params)
      redirect_to admin_users_path(@user.id), flash:{success: "You have updated user successfully."}
   else
      render  action: :edit
   end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "退会させました。"
      redirect_to root_path
    else
      render :out
    end
  end

  def out
  end

  def user_find
    @user = User.find(params[:id])
  end

private

    def user_params
    params.require(:user).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phone, :email, :profile_image)
  end


end
