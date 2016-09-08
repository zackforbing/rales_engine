class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  belongs_to :customer
  belongs_to :merchant

  def self.paid
    joins(:transactions).where("result = 'success'")
  end

  def self.unpaid
    joins(:transactions).where.not("result = 'success'")
  end
end
