class Api::V1::Items::FindController < ApplicationController
  def index
    item_found_all = Item.where(search_param)
    respond_with item_found_all
  end

  def show
    item_found = Item.where(search_param).first
    respond_with item_found
  end

  private

  def search_param
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id)
  end
end
