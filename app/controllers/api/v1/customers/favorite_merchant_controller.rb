class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end
end
