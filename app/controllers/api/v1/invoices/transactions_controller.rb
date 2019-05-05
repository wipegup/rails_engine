class Api::V1::Invoices::TransactionsController < Api::V1::Invoices::BaseController
  def initialize
    @relation = :transactions
  end
end
