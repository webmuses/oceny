class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_or_create_by(basic_user_attributes)

    return not_found unless user.can_review?

    session[:user_id] = user.id
    redirect_to(dashboard_path)
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end

  protected

  def basic_user_attributes
    {
      provider: auth['provider'],
      uid: auth['uid'],
      nickname: auth['info']['nickname']
    }
  end

  def auth
    request.env['omniauth.auth']
  end
end
