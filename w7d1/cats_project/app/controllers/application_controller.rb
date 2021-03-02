class ApplicationController < ActionController::Base

  helper_method :current_user

  def login_user!
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    session[:session_token] = user.reset_session_token!

  end


  def current_user

    @current_user ||= User.find_by(session_token: session[:session_token])

  end

end
