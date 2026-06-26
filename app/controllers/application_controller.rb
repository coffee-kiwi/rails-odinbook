class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  # Always check authentication before anything
  before_action :authenticate_user!

  # Add username to strong parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :avatar ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :avatar ])
  end

  private

  def after_sign_out_path_for(user)
    new_user_session_path
  end
end
