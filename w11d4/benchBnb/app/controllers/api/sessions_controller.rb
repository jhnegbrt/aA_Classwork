class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Incorrect Credentials'], status: 401
    else
      login!(@user)
      render 'api/users/show'
  end

  def destroy
    if logged_in?
      logout!
      render {}
    else
      render json: session.errors.full_messages, status: 404
    end
  end
end
