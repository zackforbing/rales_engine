class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    invoices = Invoice.where(merchant_id: params[:id])
    respond_with invoices
  end

  def show
    Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
