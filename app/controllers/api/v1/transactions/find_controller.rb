class Api::V1::Transactions::FindController < ApplicationController
  def index
    transaction_found_all = Transaction.where(search_param => params["#{search_param}"])
    respond_with transaction_found_all
  end

  def show
    transaction_found = Transaction.find_by(search_param => params["#{search_param}"])
    respond_with transaction_found
  end

  private

  def search_param
    params.keys.first.to_sym
  end
end
