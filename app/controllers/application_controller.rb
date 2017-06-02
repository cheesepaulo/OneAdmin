class ApplicationController < ActionController::Base
  # Pundit
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Authenticate with devise
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # Set layout
  layout :layout_by_resource

  private

  # Pundit rescue
  def user_not_authorized
    flash[:alert] = t('messages.denied')
    redirect_to(request.referrer || root_path)
  end

  # Layout per resource_name
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "devise"
    else
      "application"
    end
  end
end
