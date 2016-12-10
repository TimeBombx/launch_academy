class SessionsController < ApplicationController
  def create
    session['id'] = 1
  end

  def destroy
  end
end
