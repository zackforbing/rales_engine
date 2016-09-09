class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.top_item_sold(record_quantity)
    Item.joins(:invoices).merge(Invoice.paid).group(:id).order("sum(invoice_items.quantity) DESC").first(record_quantity)
  end
end
