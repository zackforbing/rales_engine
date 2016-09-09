class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.all_revenue_by_date(date)
    self.joins(invoices: [:transactions, :invoice_items])
        .merge( Invoice.successful )
        .group("merchants.id, invoice_items.id")
        .select("merchants.*, invoice_items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
        .where("invoices.created_at = '#{date}'").total_revenue
  end

  def total_revenue_by_date(date)
    self.invoices.successful.joins(:invoice_items).where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def total_revenue_by_date(date)
    self.invoices.successful.joins(:invoice_items).where("invoices.created_at = '#{date}'").sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def customers_with_pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def favorite_customer
    customer_id = invoices.successful.group(:customer_id).order("count_id desc").count("id").first[0]
    Customer.find(customer_id)
  end

  def total_revenue
    self.invoices.successful
        .joins(:invoice_items)
        .sum("invoice_items.quantity * invoice_items.unit_price")
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
