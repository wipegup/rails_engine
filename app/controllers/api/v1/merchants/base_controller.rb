class Api::V1::Merchants::BaseController < RelationsController
  def initialize
    @model = Merchant
  end

  def id
    params[:merchant_id]
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
