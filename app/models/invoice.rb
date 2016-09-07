class Invoice < ApplicationRecord
  has_many :credit_card_transactions
  belongs_to :customer
end
