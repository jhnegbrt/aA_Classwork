class ToysController < ApplicationController
  def index
    if params["category_id"]
      @toys = Toy.where(category_id: params["category_id"])
    else
      @toys = Toy.all
    end
  end
end