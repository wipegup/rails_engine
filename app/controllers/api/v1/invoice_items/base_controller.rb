class Api::V1::InvoiceItems::BaseController < RelationsController
  def initialize
    @model = InvoiceItem
  end

  def id
    params[:invoice_item_id]
  end

  def index
    @id = id
    super
  end

  def show
    @id = id
    super
  end
end
