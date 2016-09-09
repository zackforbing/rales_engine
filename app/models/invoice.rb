class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  belongs_to :customer
  belongs_to :merchant

  def self.pending
    joins(:transactions).where("transactions.result = 'failed'")
  end

  def self.successful
      joins(:transactions).where("transactions.result = 'success'")
  end
end
