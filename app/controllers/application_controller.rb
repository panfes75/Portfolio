class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname avatar])
  end
end
