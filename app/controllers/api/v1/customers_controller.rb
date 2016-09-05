class Api::V1::CustomersController < Api::V1::BaseController
  def index
    @customers = Customer.all.to_json
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end
end
