class ApplicationController < ActionController::Base
  helper_method current_user
  helper_method logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def logged_in?
    !!self.current_user
  end
  
  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end
  
  def log_out!
    user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end
end
