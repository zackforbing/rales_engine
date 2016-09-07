class Api::V1::Items::MerchantsController < ApplicationController

  def show
    item = Item.find(params[:id])
    merchant = Merchant.where(id: item.merchant_id)
    respond_with merchant
  end
end
