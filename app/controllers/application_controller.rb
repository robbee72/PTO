class ApplicationController < ActionController::Base
  include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_user!

   rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end
#change calendars_path
   def after_sign_in_path_for(resource)
     calendars_path
   end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, except: [:employee_number, :email]) << :name
   end
  end
