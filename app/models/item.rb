class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_item_sold(number_of_results)
    Item.joins(:invoices).merge(Invoice.successful).group(:id).order("sum(invoice_items.quantity) DESC").first(number_of_results)
  end

  def best_day
    result = self.invoices.successful.group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").first.created_at
    {"best_day"=>"#{result}"}
  end

  def self.most_revenue(number_of_results)
    Item.joins(:invoices).merge(Invoice.successful).group(:id).order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").first(number_of_results)
  end
end
