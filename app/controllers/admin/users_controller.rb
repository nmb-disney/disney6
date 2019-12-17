class Admin::UsersController < Admin::ApplicationController
  before_action :user_find, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
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

end
