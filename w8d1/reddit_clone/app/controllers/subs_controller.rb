#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                 user_subs POST   /users/:user_id/subs(.:format)                                                           subs#create
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                      subs GET    /subs(.:format)                                                                          subs#index
#                   new_sub GET    /subs/new(.:format)                                                                      subs#new
#                  edit_sub GET    /subs/:id/edit(.:format)                                                                 subs#edit
#                       sub GET    /subs/:id(.:format)                                                                      subs#show
#                           PATCH  /subs/:id(.:format)                                                                      subs#update
#                           PUT    /subs/:id(.:format)                                                                      subs#update
#                           DELETE /subs/:id(.:format)                                                                      subs#destroy
#               new_session GET    /session/new(.:format)                                                                   sessions#new
#                   session DELETE /session(.:format)                                                                       sessions#destroy
#                           POST   /session(.:format)                                                                       sessions#create

class SubsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :edit, :update, :create, :destroy]

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(**sub_params, moderator_id: params[:id])

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end
  
  def edit
    @sub = Sub.find_by(id: params[:id])
  end
  
  def update
    @sub = Sub.find_by(id: params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy

  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
