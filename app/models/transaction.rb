class Transaction < ApplicationRecord
  belongs_to :invoice
  scope :fail, -> { where( result: "failed" ).limit(1) }
  scope :paid, -> { where.not( result: "success" ) }
end
