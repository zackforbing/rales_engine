class Api::V1::Customers::FindController < ApplicationController
  def index
    customer_found_all = Customer.where(search_param => params["#{search_param}"])
    respond_with customer_found_all
  end

  def show
    customer_found = Customer.find_by(search_param => params["#{search_param}"])
    respond_with customer_found
  end

  private

  def search_param
    params.keys.first.to_sym
  end
end
