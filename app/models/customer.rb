class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
      self.merchants.joins(:transactions).where(result: "success").
      # .select("merchants.*, count(invoices.merchant_id) AS order_count").order("order_count DESC").first
  end
end
