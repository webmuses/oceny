class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    begin
      @current_user ||= User.find(session[:user_id])
    rescue
      nil
    end
  end

  helper_method :current_user
end
