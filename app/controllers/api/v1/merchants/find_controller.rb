class Api::V1::Merchants::FindController < ApplicationController
  def index
    merchant_found_all = Merchant.where(search_param)
    respond_with merchant_found_all
  end

  def show
    merchant_found = Merchant.find_by(search_param)
    respond_with merchant_found
  end

  private

  def search_param
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
