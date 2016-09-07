class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    customer = Customer.find(invoice.customer_id)
    respond_with customer
  end
end
