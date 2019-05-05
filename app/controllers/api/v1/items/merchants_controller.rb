class Api::V1::Items::MerchantsController < Api::V1::Items::BaseController
  def initialize
    @relation = :merchants
    super
  end
end
