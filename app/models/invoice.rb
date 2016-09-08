class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  belongs_to :customer
  belongs_to :merchant

  scope :paid, -> { joins(:transactions).where("transactions.result = 'success'") }
  scope :failed, -> { joins(:transactions).where("transactions.result = 'failed'") }

  def self.failed_transactions
    joins(:transactions).unscope(:transactions).where.not("result = 'success'")
  end
end
