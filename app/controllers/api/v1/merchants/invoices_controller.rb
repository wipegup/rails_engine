class Api::V1::Merchants::InvoicesController < Api::V1::Merchants::BaseController
  def initialize
    @relation = :invoices
    super
  end
end
