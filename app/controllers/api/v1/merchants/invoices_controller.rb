class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    respond_with Invoice.where(merchant_id: params[:id])
  end

  def show
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end
end
