class Api::V1::CustomersController < ApplicationController

  def index
    @customers = Customer.all.to_json
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end

end
