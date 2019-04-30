FactoryBot.define do
  factory :transaction do
    association :invoice , factory: :invoice
    credit_card_number { "MyString" }
    credit_card_expiration_date { "2019-04-30" }
    result { 0 }
  end
end
