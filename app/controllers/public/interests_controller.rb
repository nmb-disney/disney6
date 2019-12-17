class Public::InterestsController < Public::ApplicationController
  def index
  	@user = User.find(current_user.id)
  end

  def create
  end

  def destroy
  end
end
