class ApplicationController < ActionController::Base

  helper_method :current_user

  def create_password(password)
    BCrypt::Password.create(password)
  end

  def login!
    token = SecureRandom::urlsafe_base64
    session[:session_token] = token
    token
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
