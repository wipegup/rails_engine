class Api::V1::CustomersController < RenderController
  def initialize
    @model = Customer
  end
end
