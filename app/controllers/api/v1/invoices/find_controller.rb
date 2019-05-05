class Api::V1::Invoices::FindController < FindController
  def initialize
    @search_terms = [:id, :customer_id, :merchant_id, :created_at, :updated_at]
    @model = Invoice
  end
end
