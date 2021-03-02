class UsersController < ApplicationController

  before_action redirect_to cats_url if session[:session_token] == nil

  def new

    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      self.login_user!
    else 
      render :new
    end
  end


 private

 def user_params
  params.require(:user).permit(:user_name, :password)
 end


end

