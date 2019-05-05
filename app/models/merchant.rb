class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  def pending_invoices
    Customer
      .joins(:invoices)
      .joins("LEFT OUTER JOIN transactions ON transactions.invoice_id = invoices.id")
      .where(invoices: {merchant_id: id})
      .group("invoices.id", :id)
      .having("COUNT(CASE WHEN transactions.result = 0 THEN 1 ELSE NULL END) = 0")
#
#       Customer.find_by_sql("SELECT c.* FROM customers AS c
# INNER JOIN invoices AS i ON i.customer_id = c.id
# LEFT OUTER JOIN transactions AS t ON t.invoice_id = i.id
# WHERE i.merchant_id = #{id}
# GROUP BY i.id, c.id
# HAVING COUNT(CASE WHEN t.result = 0 THEN 1 ELSE NULL END) = 0;
# ")
  end

  def self.revenue(date)
    joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .where(transactions:{updated_at: [date.beginning_of_day..date.end_of_day]})
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def favorite_customer
    Customer
    .joins(invoices: :transactions)
    .where('transactions.result = 0')
    .where(invoices: {merchant_id: self[:id]})
    .group(:id)
    .order(Arel.sql("COUNT(customers.id) DESC"))
    .first
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
    joins(:transactions)
    .joins('INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id"')
    .group(:id)
    .order(Arel.sql('items_sold DESC'))
    .where('transactions.result = 0')
    .select('merchants.*, SUM(invoice_items.quantity) as items_sold')
    .limit(limit)
  end
end
