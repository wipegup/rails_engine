FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "Item #{n}" }
    description { Faker::ChuckNorris.fact }
    sequence( :unit_price) { |n| n*10 }
    association :merchant, factory: :merchant
  end
end
