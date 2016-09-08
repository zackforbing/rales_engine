class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    customer = Merchant.find(params[:id]).favorite_customer
    respond_with customer
  end
end
