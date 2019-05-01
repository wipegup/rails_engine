class Api::V1::Customers::RelationsController < RelationsController
  def show
    @model = Customer
    super
  end
end
