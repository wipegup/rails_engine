class Api::V1::Items::FindController < FindController
  def initialize
    @search_terms = [:id, :name, :description, :unit_price,
                     :merchant_id, :created_at, :updated_at]
    @model = Item
  end
end
