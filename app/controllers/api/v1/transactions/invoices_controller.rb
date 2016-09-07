class Api::V1::Transactions::InvoicesController < ApplicationController
  def index
    invoice = CreditCardTransaction.find(params[:id]).invoice
    respond_with invoice
  end
end
