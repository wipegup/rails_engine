class Api::V1::Invoices::BaseController < RelationsController
  def initialize
    @model = Invoice
  end

  def id
    params[:invoice_id]
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
