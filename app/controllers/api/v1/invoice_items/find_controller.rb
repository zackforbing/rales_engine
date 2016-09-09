class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    invoice_item_found_all = InvoiceItem.where(search_param)
    respond_with invoice_item_found_all
  end

  def show
    invoice_item_found = InvoiceItem.find_by(search_param)
    respond_with invoice_item_found
  end

  private

  def search_param
    params.permit(:id, :quantity, :unit_price, :created_at, :updated_at, :invoice_id, :item_id)
  end
end
