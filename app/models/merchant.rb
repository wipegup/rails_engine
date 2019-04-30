class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(limit = nil)

    query = joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .group(:id)
    .order(Arel.sql('SUM(invoice_items.quantity * invoice_items.unit_price) DESC'))
    .where('transactions.result = 0')

    return query.limit(limit) if limit
    query
  end
end
