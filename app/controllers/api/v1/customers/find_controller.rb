class Api::V1::Customers::FindController < ApplicationController
  def index
    customer_found_all = Customer.where(search_param)
    respond_with customer_found_all
  end

  def show
    customer_found = Customer.find_by(search
  end

  private

  def search_param
    params.permit(:first_name, :last_name, :created_at, :updated_at)
  end
end
