class Api::SessionsController < ApplicationController
  def create
    
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
