class Api::V1::InvoicesController < RenderController
  def initialize
    @model = Invoice
  end
end
