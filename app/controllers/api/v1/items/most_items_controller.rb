class Api::V1::Items::MostItemsController < ApplicationController
  def index
    respond_with Item.top_item_sold(params[:quantity])
  end
end
