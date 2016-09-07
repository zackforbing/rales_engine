class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all.to_json
    respond_with @items
  end

  def show
    @item = Item.find(params[:id])
    respond_with @item
  end
end
