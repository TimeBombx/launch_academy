class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :user

  helper_method :is_user_authenticated?

  def auth_user(user)
    session['id'] = user.id
  end

  def is_user_authenticated?
    @user.present?
  end

  def user
    @user = User.find(session['id']) if session['id']
  end
end
