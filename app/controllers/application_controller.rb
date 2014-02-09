class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # After sign in go to the root path
  def after_sign_in_path_for(resource_name)
    root_path
  end

  def after_sign_in_path_for(resource)
    listings_path
  end
end
