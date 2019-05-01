class Api::V1::Customers::RelationsController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    relation = params[:relation].to_sym
    render json: serializers[relation].new(customer.send relation)
  end
end
