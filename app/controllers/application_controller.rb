class ApplicationController < ActionController::Base


  rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  rescue_from ActionController::RoutingError, :with => :rescue404


  def rescue404
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  # devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
  # devise_parameter_sanitizer.permit(:sign_in, keys: %i[username])
  # devise_parameter_sanitizer.permit(:account_update, keys: %i[username])
  # end


end
