class Customer < ApplicationRecord
  has_many :invoices
  has_many :credit_card_transactions, through: :invoices
end
