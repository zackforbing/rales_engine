class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    @invoices = Invoice.all.to_json
    respond_with @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_with @invoice
  end
end
