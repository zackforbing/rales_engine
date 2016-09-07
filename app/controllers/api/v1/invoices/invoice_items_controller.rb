class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.where(invoice_id: params[:id])
    respond_with invoice_items
  end
end
