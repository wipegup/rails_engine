class Api::V1::Invoices::CustomersController < Api::V1::Invoices::BaseController
  def initialize
    @relation = :customers
    super
  end
end
