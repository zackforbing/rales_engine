class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchant = Merchant.find(params[:id]).revenue_by_date(params[:date])
    respond_with merchant
  end

  def show
    merchants = Merchant.most_revenue(params[:quantity])
    respond_with merchants
  end
end
