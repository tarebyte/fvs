class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Check if the current slug is not the cannonical one.
  def bad_slug?(object)
    params[:id] != object.to_param
  end

  def redirect_to_good_slug(object)
    redirect_to params.merge({
      :controller => controller_name,
      :action => params[:action],
      :id => object.to_param,
      :status => :moved_permanently
    })
  end

  protected

  def after_sign_in_path_for(resource_name)
    root_path
  end

  def after_sign_in_path_for(resource)
   root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private

  def permission_denied
    head 403
  end

  def user_not_authorized
    self.response_body = nil
    flash[:error] = "You are not authorized to perform this action."
    redirect_to root_path and return
  end
end
