FactoryBot.define do
  factory :invoice do
    association :customer, factory: :customer
    association :merchant, factory: :merchant
    status { 2 }
  end
end
