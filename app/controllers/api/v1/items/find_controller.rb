class Api::V1::Items::FindController < ApplicationController
  def index
    item_found_all = Item.where(search_param => params["#{search_param}"])
    respond_with item_found_all
  end

  def show
    item_found = Item.find_by(search_param => params["#{search_param}"])
    respond_with item_found
  end

  private

  def search_param
    params.keys.first.to_sym
  end
end
