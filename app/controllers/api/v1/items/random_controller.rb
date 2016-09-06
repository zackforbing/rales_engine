class Api::V1::Items::RandomController < ApplicationController

  def show
    item = Item.limit(1).order("RANDOM()")
    respond_with item
  end
end
