require 'rails_helper'

RSpec.describe Merchant, type: :model do
  before :each, full_setup: true do
    @merchants = []; @invoices = []
    @items = []; @customers = []
    5.times do
      merchant = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, merchant: merchant, customer:customer)
      item = create(:item, merchant: merchant)
      @merchants << merchant; @invoices << invoice;
      @items << item; @customers << customer
    end

    @invoices.each_with_index do |invoice, idx|
      create(:invoice_item, unit_price: idx, quantity: idx, invoice: invoice, item: @items[idx])
      date = idx.day.ago
      create(:transaction, result: 'success', invoice: invoice, created_at:date, updated_at:date)

      if idx % 3 == 0
        create(:transaction, result: 'failed', invoice: invoice)
      end
    end
  end

  describe 'class methods' do
    it '.most_revenue(limit)', :full_setup do

      expected = @merchants[3..4].reverse
      actual = Merchant.most_revenue(2)

      expect(actual).to eq(expected)

      expect(actual[0][:revenue]).to eq(16)

      expected = @merchants[2..4].reverse
      actual = Merchant.most_revenue(3)

      expect(actual).to eq(expected)

      expected = @merchants.reverse
      actual = Merchant.most_revenue

      expect(actual).to eq(expected)
    end

    it '.most_items(limit)', :full_setup do

      expected = @merchants[3..4].reverse
      actual = Merchant.most_items(2)

      expect(actual).to eq(expected)
      expect(actual[0][:items_sold]).to eq(4)

      expected = @merchants[2..4].reverse
      actual = Merchant.most_items(3)

      expect(actual).to eq(expected)

      expected = @merchants.reverse
      actual = Merchant.most_items

      expect(actual).to eq(expected)

    end

    it '.revenue(date)', :full_setup do
      two_days_ago = 2.day.ago.to_date
      expected = 4
      actual = Merchant.revenue(two_days_ago)

      expect(actual).to eq(expected)

    end
  end

  describe 'instance methods' do
    it '.revenue', :full_setup do
      actual = @merchants[4].revenue
      expect(actual).to eq(16)
    end

    it '.revenue(date)', :full_setup do
      merchant = @merchants[2]
      two_days_ago = 2.day.ago.to_date

      expected = 4
      actual = merchant.revenue(two_days_ago)
      expect(actual).to eq(expected)

      expected = 0
      actual = merchant.revenue(Date.today)
      expect(actual).to eq(expected)
    end

    it '.favorite_customer', :full_setup do
      expect(@merchants[1].favorite_customer).to eq(@customers[1])
      expect(@merchants[2].favorite_customer).to eq(@customers[2])
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
