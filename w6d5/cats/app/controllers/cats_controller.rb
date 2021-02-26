class CatsController < ApplicationController
   def index
    @cats = Cats.all

    #render :index
   end
end