class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.all_revenue_by_date(date)
    result = self.joins(:invoice_items).merge(Invoice.successful).where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")
    {"total_revenue"=>"#{result}"}

  end

  def total_revenue_by_date(date)
    result = self.invoices.successful.joins(:invoice_items).where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")
    {"revenue"=>"#{result}"}
  end

  def customers_with_pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def favorite_customer
    customer_id = invoices.successful.group(:customer_id).order("count_id desc").count("id").first[0]
    Customer.find(customer_id)
  end

  def total_revenue
    result = self.invoices.successful.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
    {"revenue"=>"#{result}"}
  end

  def self.most_revenue(number_of_results)
    self.joins(:invoice_items).merge(Invoice.successful).group("merchants.id").order("sum(invoice_items.quantity * invoice_items.unit_price) DESC").first(number_of_results)
  end

  def self.most_items(number_of_results)
    self.joins(:invoice_items).merge(Invoice.successful).group("merchants.id").order("sum(invoice_items.quantity) DESC").first(number_of_results)
  end

  def self.most_items(number_of_results)
    self.joins(:invoice_items).merge(Invoice.successful).group("merchants.id").order("sum(invoice_items.quantity) DESC").first(number_of_results)
  end
end
