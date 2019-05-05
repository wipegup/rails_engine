class Api::V1::MerchantsController < RenderController
  def initialize
    @model = Merchant
  end
end
