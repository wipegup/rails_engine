class Api::V1::Invoices::InvoiceItemsController < Api::V1::Invoices::BaseController
  def initialize
    @relation = :invoice_items
    super
  end
end
