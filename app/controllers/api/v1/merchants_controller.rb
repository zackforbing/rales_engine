class Api::V1::MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all.to_json
    render json: @merchants
  end

  def show
    @merchant = Merchant.find(params[:id])
    render json: @merchant
  end

end
