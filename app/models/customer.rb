class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    # .merchants.joins(:invoices).group(:id).select("merchants.*, count(invoices.merchant_id) AS order_count").order("order_count DESC").first
    id = self.invoices.group(:merchant_id).order('count_id DESC').count(:id).first.first
    Merchant.find(id)
  end
end
