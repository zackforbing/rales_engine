class Api::V1::Invoices::RandomController < ApplicationController
  def show
    invoice = Invoice.limit(1).order("RANDOM()")
    respond_with invoice
  end
end
