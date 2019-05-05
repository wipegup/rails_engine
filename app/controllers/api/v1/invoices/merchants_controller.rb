class Api::V1::Invoices::MerchantsController < Api::V1::Invoices::BaseController
  def initialize
    @relation = :merchants
    super
  end
end
