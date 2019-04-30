class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  
  def self.most_revenue(limit = nil)
    binding.pry
  end
end
