class Api::V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    respond_with transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    respond_with transaction
  end
end
