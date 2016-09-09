class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.revenue_by_date(date)
    self.joins(invoices: [:transactions, :invoice_items])
        .merge( Invoice.successful_trans )
        .group("merchants.id, invoice_items.id")
        .select("merchants.*, invoice_items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_price")
        .where("invoices.created_at = '#{date}'")
  end

  def customers_with_pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def favorite_customer
    customer_id = invoices.successful.group(:customer_id).order("count_id desc").count("id").first[0]
    Customer.find(customer_id)
  end

  def revenue
    self.invoices.successful
        .joins(:invoice_items)
        .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.most_revenue(number_of_results)
    self.joins(invoices: [:invoice_items])
        .merge( Invoice.successful_trans)
        .group("merchants.id, invoice_items.id")
        .select("merchants.id, invoice_items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_amount")
        .order("total_amount DESC")
        .first(number_of_results)
  end
end
