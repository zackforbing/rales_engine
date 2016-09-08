class Transaction < ApplicationRecord
  belongs_to :invoice
  default_scope { where.not( result: "failed" ) }
end
