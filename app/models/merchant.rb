class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  # has_many :invoice_items, through: :invoices

  def self.revenue(date)
    date = Date.parse("2012-08-09")
    self.joins(:invoices).group(:id).select("merchants.*, invoice_items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_price").where("invoices.created_at = #{date}")
    # :created_at => selected_date.beginning_of_day..selected_date.end_of_day)
  end

  # def customers_with_pending_invoices
  #   self.customers.joins(:invoices).where( { invoices: { status: "pending" } } )
  # end

  # def favorite_customer
  #   self.customers.joins(:invoices).group(:id).select("customers.*, count(invoices.customer_id) AS order_count").order("order_count DESC").first
  # end

  # def total_revenue
  #   self.invoices.joins(:invoice_items).where.not(status: "pending").sum("invoice_items.quantity * invoice_items.unit_price")
  # end

  def self.most_revenue(number_of_results)
    self.joins(:invoices).select("merchants.id, invoice_items.quantity, invoice_items.unit_price, sum(invoice_items.quantity * invoice_items.unit_price)").limit(number_of_results)
  end

  def self.most_items(x)
    self.joins(:invoice_items).group("merchants.id, invoice_items.quantity").select("merchants.id, invoice_items.quantity, count(invoice_items.quantity) AS items_sold").order("items_sold DESC").limit(x)
  end
end
