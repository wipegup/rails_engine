class Api::V1::Customers::RelationsController < RelationsController
  def initialize
    @model = Customer
  end
end
