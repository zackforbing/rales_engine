class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def index
    invoice_item = InvoiceItem.find(params[:id])
    invoices = Invoice.where(id: invoice_item.invoice_id)
    respond_with invoices
  end
end
