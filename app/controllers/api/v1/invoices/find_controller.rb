class Api::V1::Invoices::FindController < ApplicationController
  def index
    invoice_found_all = Invoice.where(search_param => params["#{search_param}"])
    respond_with invoice_found_all
  end

  def show
    invoice_found = Invoice.find_by(search_param => params["#{search_param}"])
    respond_with invoice_found
  end

  private

  def search_param
    params.keys.first.to_sym
  end
end
