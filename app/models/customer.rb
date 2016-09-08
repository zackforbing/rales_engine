class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    id = self.invoices.paid.group(:merchant_id).order('count_id DESC').count(:id).first.first
    Merchant.find(id)
  end
end
