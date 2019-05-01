class Api::V1::CustomersController < ApplicationController
  def index
    render json: CustomerSerializer.new(Customer.all)
  end

  def show
    if params[:id] != 'random'
      customer = Customer.find(params[:id])
    else
      customer = Customer.random
    end

    render json: CustomerSerializer.new(customer)
  end
end
