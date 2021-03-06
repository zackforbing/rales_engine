class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    id = self.invoices.group(:merchant_id).order('count_id DESC').count(:id).first.first
    Merchant.find(id)
  end
end
