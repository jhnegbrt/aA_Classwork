class CatsController < ApplicationController
   def index
      @cats = Cat.all
      # render :index
   end

   def show
      
      @cat = Cat.find_by(id: params[:id])

      # render json: @cat

      render :show
      
      # if @cat
         
      # else
      #    redirect_to cats_url
      # end

   end

   def new
      @new_cat = Cat.new

      render :new
   end
end