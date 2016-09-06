class Api::V1::Customers::RandomController < ApplicationController

  def show
    customer = Customer.limit(1).order("RANDOM()")
    respond_with customer
  end
end
