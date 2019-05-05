class Api::V1::InvoiceItems::ItemsController < Api::V1::InvoiceItems::BaseController
  def initialize
    @relation = :items
    super
  end
end
