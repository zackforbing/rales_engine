class Api::V1::TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.to_json
    render json: @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end
end
