class Api::V1::Customers::FindController < FindController
  def show
    @search_terms = [:id,:first_name,:last_name]
    @model = Customer
    super
  end
end
