class Api::V1::Customers::BaseController < RelationsController
  def initialize
    @model = Customer
  end

  def id
    params[:customer_id]
  end

  def index
    @id = id
    super
  end

  def show
    @id = id
    super
  end
end
