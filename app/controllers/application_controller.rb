class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password,
        :password_confirmation, :current_password, :mobile)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password,
        :password_confirmation, :current_password, :mobile)
    end
  end
end
