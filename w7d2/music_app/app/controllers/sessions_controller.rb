class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    find_user_by_credentials(params[:user][:email], params[:user][:password])
    token = SecureRandom::urlsafe_base64
    session[:session_token] = token
    render :new

  end

  def find_user_by_credentials(email, password)

    if User.find_by(email: email)
      @user = User.find_by(email: email)
      if is_password(password)
    else
      flash.now[:errors] = "Credentials not found"
    end

  end

  def destroy

    current_user.session_token = nil
    current_user = nil
    session[:session_token] = nil
    redirect_to users_url

  end

  private
  def user_params

    params.require(:user).permit(:email, :password)

  end
end