class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    transactions = Customer.find(params[:id]).credit_card_transactions
    respond_with transactions
  end
end
