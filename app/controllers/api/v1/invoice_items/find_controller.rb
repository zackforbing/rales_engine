class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    invoice_item_found_all = InvoiceItem.where(search_param => params["#{search_param}"])
    respond_with invoice_item_found_all
  end

  def show
    invoice_item_found = InvoiceItem.find_by(search_param => params["#{search_param}"])
    respond_with invoice_item_found
  end

  private

  def search_param
    params.keys.first.to_sym
  end
end
