class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  enum status: ['pending', 'packaged', 'shipped', 'cancelled']

end
