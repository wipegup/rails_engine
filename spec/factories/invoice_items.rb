FactoryBot.define do
  factory :invoice_item do
    item { create(:item) }
    invoice { create(:invoice) }
    quantity { 1 }
    unit_price { "9.99" }
  end
end
