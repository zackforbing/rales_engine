require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest
    test "can find all items" do

      get "/api/v1/items"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a items invoices" do
      customer = Item.first

      get "/api/v1/items/#{customer.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a items items" do
      customer = Item.first

      get "/api/v1/items/#{customer.id}/items"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a items favorite merchant" do
      customer = Item.first

      get "/api/v1/items/#{customer.id}/favorite_merchant"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
