class InvoiceItemsSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :formatted_unit_price, :invoice_id, :item_id
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    "#{object.unit_price}"
  end
end
