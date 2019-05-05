class Api::V1::TransactionsController < RenderController
  def initialize
    @model = Transaction
  end
end
