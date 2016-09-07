class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    items = InvoiceItem.joins(:items)where(invoice_id: params[:id])
    respond_with items
  end
end
