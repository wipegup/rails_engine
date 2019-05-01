class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    order(Arel.sql("RANDOM()")).first
  end
end
