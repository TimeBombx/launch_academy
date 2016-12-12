class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params['username'])
    if user.present?
      session['id'] = user.id
      redirect_to '/'
    end
  end

  def destroy
  end
end
