class Api::V1::CreditCardTransactionsController < ApplicationController
  def index
    @transactions = CreditCardTransaction.all.to_json
    render json: @transactions
  end

  def show
    @transaction = CreditCardTransaction.find(params[:id])
    render json: @transaction
  end
end
