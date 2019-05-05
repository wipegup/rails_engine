class Api::V1::Transactions::BaseController < RelationsController
  def initialize
    @model = Transaction
  end

  def id
    params[:transaction_id]
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
