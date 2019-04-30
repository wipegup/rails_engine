FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number { "MyString" }
    credit_card_expiration_date { "2019-04-30" }
    result { 1 }
  end
end
