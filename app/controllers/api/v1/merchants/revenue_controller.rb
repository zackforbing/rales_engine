class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    if params[:date]
      respond_with Merchant.all_revenue_by_date(params[:date])
    else
      respond_with Merchant.most_revenue(params[:quantity])
    end
  end

  def show
    if params[:date]
      # single merchant revenue by date
    else
      respond_with Merchant.find(params[:id]).total_revenue
    end
  end
end
