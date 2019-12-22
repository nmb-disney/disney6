class Admin::UsersController < Admin::ApplicationController
  before_action :user_find, only: [:show, :edit, :update]

  def index
    @users = User.page(params[:page]).per(10)

  end

  def show
    @users = User.page(params[:page]).per(10)
  end

  def edit
  end

  def update

  end

  def destroy
  end

  def out
  end

  def user_find
    @user = User.find(params[:id])
  end

private

    def user_params
     params.require(:user).permit(:id)
    end


end
