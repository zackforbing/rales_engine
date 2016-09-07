class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.where(item_id: params[:id])
    respond_with invoice_items
  end
end
