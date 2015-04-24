class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate

  def authenticate
    redirect_to(login_path) unless current_user
  end

  def current_user
    begin
      @current_user ||= User.find(session[:user_id])
    rescue
      nil
    end
  end

  def not_found
    render file: 'public/404', status: 404
  end

  helper_method :current_user
end
