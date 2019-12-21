class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?
    add_flash_types :success, :info, :warning, :danger
def after_sign_in_path_for(resource)
  case resource
  when User
    public_user_path(resource.id)
  when Admin
    new_admin_cd_path
  end
end

def after_sign_up_path_for(resource)
  case resource
  when User
    public_user_path(resource.id)
  when Admin
    new_admin_cd_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :postalcode, :address, :phone])
  end

end