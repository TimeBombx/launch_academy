class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :user

  helper_method :is_admin?
  helper_method :is_user_authenticated?

  def auth_user(user)
    session['id'] = user.id
  end

  def user
    @auth_user = User.find(session['id']) if session['id']
  end

  def is_user_authenticated?
    @auth_user.present?
  end

  def is_admin?
    @auth_user.role == 'admin' if is_user_authenticated?
  end
end
