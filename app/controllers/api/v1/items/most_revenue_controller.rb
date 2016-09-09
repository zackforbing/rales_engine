class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    respond_with Item.most_revenue(params[:quantity])
  end
end
