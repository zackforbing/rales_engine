class Api::V1::InvoicesController < ApplicationController
  def index
    invoices = Invoice.all
    respond_with invoices
  end

  def show
    invoice = Invoice.find(params[:id])
    respond_with invoice
  end
end
