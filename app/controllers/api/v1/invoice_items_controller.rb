class Api::V1::InvoiceItemsController < RenderController
  def initialize
    @model = InvoiceItem
  end
end
