class Api::V1::InvoiceItems::FindController < FindController
  def initialize
    @search_terms = [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at,:updated_at]
    @model = InvoiceItem
  end
end
