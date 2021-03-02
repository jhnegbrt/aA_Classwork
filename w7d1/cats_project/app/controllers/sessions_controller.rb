class SessionsController < ApplicationController

  before_action redirect_to cats_url if session[:session_token] == nil

  def new

    render :new

  end

  def create

    self.login_user!

    # user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    # session[:session_token] = user.reset_session_token!

    redirect_to cats_url

    # if user

  end

  def destroy

    if current_user 
      current_user.reset_session_token!
      session[:session_token] = nil 
    end

  end

end
