class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    merchant = Merchant.find(invoice.merchant_id)
    respond_with merchant
  end
end
