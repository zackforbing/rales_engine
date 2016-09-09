class Api::V1::Transactions::InvoicesController < ApplicationController
  def show
    invoice = Transaction.find(params[:id]).invoice
    respond_with invoice
  end
end
