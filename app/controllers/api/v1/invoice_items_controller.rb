class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    @invoice_items = InvoiceItem.all.to_json
    respond_with @invoice_items
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    respond_with @invoice_item
  end
end
