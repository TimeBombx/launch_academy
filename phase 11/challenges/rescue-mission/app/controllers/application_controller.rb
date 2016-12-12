class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :signin

  private
    def signin
      if session['id']
        @user = User.find(session['id'])
      end
    end
end
