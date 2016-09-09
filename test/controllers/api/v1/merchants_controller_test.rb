require_relative './../../test_helper'

class Api::V1::MerchantsControllerTest < ActionDispatch::IntegrationTest
    test "can find all merchants" do

      get "/api/v1/merchants"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a merchants invoices" do
      customer = Merchant.first

      get "/api/v1/merchants/#{customer.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a merchants transactions" do
      customer = Merchant.first

      get "/api/v1/merchants/#{customer.id}/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a merchants favorite merchant" do
      customer = Merchant.first

      get "/api/v1/merchants/#{customer.id}/favorite_merchant"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
