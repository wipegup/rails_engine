class Api::V1::Merchants::FindController < FindController
  def initialize
    @search_terms = [:id,:name,:created_at, :updated_at]
    @model = Customer
  end
end
