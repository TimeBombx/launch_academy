class UsersController < ApplicationController
  layout "layout"

  def show
    @user = User.find(params['id'])
  end

  def new
    @user = User.new
  end

  def create
    if user_params[:password].nil? || user_params[:password] != params[:user][:password_confirmation] ||  user_params[:password].empty?
      redirect_to new_user_path
    else
      user = User.create(user_params)
      auth_user(user)
      redirect_to items_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
