class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    transactions = Transaction.where(invoice_id: params[:id])
    respond_with transactions
  end
end
