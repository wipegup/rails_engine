class Api::V1::Customers::FindController < FindController
  def initialize
    @search_terms = [:id,:first_name,:last_name,:created_at,:updated_at]
    @model = Customer
  end
end
