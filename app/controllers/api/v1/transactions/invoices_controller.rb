class Api::V1::Transactions::InvoicesController < ApplicationController
  def index
    invoice = Transaction.find(params[:id]).invoices
    respond_with invoice
  end
end
