FactoryBot.define do
  factory :invoice do
    customer { create(:customer) }
    merchant { create(:merchant) }
    status { 1 }
  end
end
