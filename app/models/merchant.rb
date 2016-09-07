class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(number_of_results)
  end

  def self.revenue(date)
  end
end
