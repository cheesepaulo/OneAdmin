class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  # Set layout
  layout :layout_by_resource

  private

  # Layout per resource_name
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "devise"
    else
      "application"
    end
  end
end
