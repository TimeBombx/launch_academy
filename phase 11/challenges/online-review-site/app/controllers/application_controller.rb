class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :user

  def auth_user(user)
    session['id'] = user.id
  end

  def user
    @user = User.find(session['id']) if session['id']
  end
end
