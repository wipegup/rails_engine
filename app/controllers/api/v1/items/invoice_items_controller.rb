class Api::V1::Items::InvoiceItemsController < Api::V1::Items::BaseController
  def initialize
    @relation = :invoice_items
    super
  end
end
