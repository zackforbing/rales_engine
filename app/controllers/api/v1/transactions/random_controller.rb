class Api::V1::Transactions::RandomController < ApplicationController

  def show
    transaction = Transaction.limit(1).order("RANDOM()")
    respond_with transaction
  end
end
