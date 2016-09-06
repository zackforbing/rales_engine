class Api::V1::InvoiceItemsController < ApplicationController
  def index
    @invoice_items = InvoiceItem.all.to_json
    render json: @invoice_items
  end

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    render json: @invoice_item
  end
end
