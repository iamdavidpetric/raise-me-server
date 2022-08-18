class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to 'http://localhost:8080'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    request.session_options[:skip] = true
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password username])
  end
end
