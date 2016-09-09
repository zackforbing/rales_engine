class ItemsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id
end
