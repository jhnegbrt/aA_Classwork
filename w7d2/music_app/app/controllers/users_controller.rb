class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create

    @user = User.new(user_params)
    @user.password=(params[:user][:password])
    @user.password_digest = create_password(params[:user][:password])
    @user.session_token = login!
    
    if @user.save
      current_user
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end

  def destroy

  end

  private
  def user_params

    params.require(:user).permit(:email, :password)

  end

end