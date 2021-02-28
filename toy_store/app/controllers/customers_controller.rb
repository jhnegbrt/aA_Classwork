class CustomersController < ApplicationController

  def index
    @customers = Customer.all

    render :index
  end
end