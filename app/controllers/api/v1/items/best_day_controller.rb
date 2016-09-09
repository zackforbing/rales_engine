class Api::V1::Items::BestDayController < ApplicationController
  def show
    respond_with Item.find(params[:id]).best_day
  end
end
