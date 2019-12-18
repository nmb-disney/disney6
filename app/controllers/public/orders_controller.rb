class Public::OrdersController < Public::ApplicationController
  def index
  end

  def new
    @user = User.find(current_user.id)
  end

  def create
  end

  def show
  end

  def detail
  end

  def finish
  end
end
