class SessionsController < ApplicationController
  layout "layout"


  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_username(user_params['username'])
    
    if user.present?
      auth_user(user) if user.password == user_params['password']
      redirect_to reviews_path
    else
      redirect_to user_login_path
    end
  end

  def destroy
    session['id'] = nil
    redirect_to reviews_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
