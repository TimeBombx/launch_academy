class UsersController < ApplicationController
  layout "layout"

  def show
    @user = User.find(params['id'])
  end

  def signin
  end
end
