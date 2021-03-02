class CatsController < ApplicationController
   def index
      @cats = Cat.all
      # render :index
   end

   def show
      
      @cat = Cat.find_by(id: params[:id])

      # render json: @cat

      # render :show
      
      # if @cat
         
      # else
      #    redirect_to cats_url
      # end

   end

   def new
      @new_cat = Cat.new

      render :new
   end

   def create
      @cat = Cat.new(cat_params)

      if @cat
         @cat.save!
         redirect_to cats_url
      else
         render json: "couldnt create cat"
      end
   end

   def cat_params
      params.require(:cats).permit(:name, :color, :sex, :description, :birth_date)
   end
end