class Api::V1::Invoices::ItemsController < Api::V1::Invoices::BaseController
  def initialize
    @relation = :items
    super
  end
end
