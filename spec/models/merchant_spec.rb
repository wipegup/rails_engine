require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'class methods' do
    it '.most_revenue(limit)' do

      merchants = []; invoices = []; items = []
      5.times do
        merchant = create(:merchant)
        invoice = create(:invoice, merchant: merchant)
        item = create(:item, merchant: merchant)
        merchants << merchant; invoices << invoice; items << item
      end
      # binding.pry
      invoices.each_with_index do |invoice, idx|
        create(:invoice_item, unit_price: idx, quantity: idx, invoice: invoice, item: items[idx])
        create(:transaction, result: 'success', invoice: invoice)

        if idx % 3 == 0
          create(:transaction, result: 'failed', invoice: invoice)


        end

        # binding.pry
      end

      expected = merchants[3..4].reverse
      actual = Merchant.most_revenue(2)

      expect(actual).to eq(expected)

      expected = merchants[2..4].reverse
      actual = Merchant.most_revenue(3)

      expect(actual).to eq(expected)

      expected = merchants.reverse
      actual = Merchant.most_revenue

      expect(actual).to eq(expected)
    end

    it '.most_items(limit)' do

    end

    it '.revenue(date)' do

    end
  end

  describe 'instance methods' do
    it '.revenue' do

    end

    it '.revenue(date)' do

    end

    it '.favorite_customer' do

    end
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many(:transactions).through :invoices}
  end
end
