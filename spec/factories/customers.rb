FactoryBot.define do
  factory :customer do
    first_name { "Customer" }
    sequence(:last_name) { |n| "#{n}" }
  end
end
