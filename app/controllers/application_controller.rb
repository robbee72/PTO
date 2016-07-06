class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #   user_params.permit(:name, :employee_number, :role, :email, :password, :password_confirmation)
    # end
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :employee_number, :email, :password, :password_confirmation) }
  end

  # def require_sign_in
  #   unless current_user
  #     flash[:alert] = "You must be logged in to do that"
  #     redirect_to new_user_session_path
  #   end
  # end
end
