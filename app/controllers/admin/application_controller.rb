class Admin::ApplicationController < ApplicationController
	 before_action :authenticate_user!
  before_action :admin_user

  private
    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end

