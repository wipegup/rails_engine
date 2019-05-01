class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.revenue(date)
    joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .where(transactions:{updated_at: [date.beginning_of_day..date.end_of_day]})
    .sum("invoice_items.quantity * invoice_items.unit_price")

  end

  def revenue(date_range = nil)
    if date_range != nil
      date_range = {transactions:
        {updated_at:
          [date_range.beginning_of_day..date_range.end_of_day]}}
    end

    transactions
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .where('transactions.result = 0')
    .where(date_range)
    .sum("invoice_items.quantity * invoice_items.unit_price")

  end

  def self.most_revenue(limit = nil)
    joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .group(:id)
    .order(Arel.sql('revenue DESC'))
    .where('transactions.result = 0')
    .select('merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) as revenue')
    .limit(limit)

  end

  def self.most_items(limit = nil)
    query = joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .group(:id)
    .order(Arel.sql('items_sold DESC'))
    .where('transactions.result = 0')
    .select('merchants.*, SUM(invoice_items.quantity) as items_sold')

    return query.limit(limit) if limit
    query
  end
end
