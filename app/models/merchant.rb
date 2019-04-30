class Merchant < ApplicationRecord
  has_many :items
  
  def self.most_revenue(limit = nil)
    binding.pry
  end
end
