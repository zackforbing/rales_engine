class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all.to_json
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end
end
