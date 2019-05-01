class Api::V1::Customers::FindController < FindController
  def show
    @search_terms = [:id,:first_name,:last_name]
    @serializer = CustomerSerializer
    @model = Customer
    super
  end
end
