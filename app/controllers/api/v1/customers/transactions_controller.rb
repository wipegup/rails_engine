class Api::V1::Customers::TransactionsController < Api::V1::Customers::BaseController
  def initialize
    @relation = :transactions
    super
  end
end
