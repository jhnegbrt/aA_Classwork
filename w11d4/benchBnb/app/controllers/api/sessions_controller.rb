class Api::SessionsController < ApplicationController
  def create
    # debugger
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      render json: ['Incorrect Credentials'], status: 401
    else
      login!(@user)
      render 'api/users/show'
    end
  end

  def destroy
    # debugger
    @user = current_user
    if @user
      logout!
      render {}
    else
      render json: ["No Current User"], status: 404
    end
  end
end
