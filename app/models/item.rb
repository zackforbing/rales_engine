class Item < ApplicationRecord
  belongs_to :merchant
  belongs_to :invoice_items
end
