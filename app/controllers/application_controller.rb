class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery # with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :employee_number
  end


  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
