class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(quantity)
  end

  def self.revenue(date)
  end
end
