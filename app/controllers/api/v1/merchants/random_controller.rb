class Api::V1::Merchants::RandomController < ApplicationController
  def show
    merchant = Merchant.limit(1).order("RANDOM()")
    respond_with merchant
  end
end
