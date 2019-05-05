class Api::V1::Transactions::FindController < FindController
  def initialize
    @search_terms = [:id, :invoice_id, :credit_card_number, :result, :created_at,:updated_at]
    @model = Transaction
  end
end
