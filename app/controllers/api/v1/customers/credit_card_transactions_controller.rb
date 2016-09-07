class Api::V1::Customers::CreditCardTransactionsController < ApplicationController
  def index
    transactions = Customer.find(params[:id]).credit_card_transactions
    respond_with transactions
  end
end
