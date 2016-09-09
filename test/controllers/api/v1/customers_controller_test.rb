require 'test_helper'

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
    test "can find all customers" do

      get "/api/v1/customers"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a customers invoices" do
      customer = Customer.first

      get "/api/v1/customers/#{customer.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a customers transactions" do
      customer = Customer.first

      get "/api/v1/customers/#{customer.id}/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a customers favorite merchant" do
      customer = Customer.first

      get "/api/v1/customers/#{customer.id}/favorite_merchant"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
