require_relative './../../test_helper'

class Api::V1::TransactionsControllerTest < ActionDispatch::IntegrationTest
    test "can find all transactions" do

      get "/api/v1/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a transactions invoices" do
      customer = Transaction.first

      get "/api/v1/transactions/#{customer.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a transactions transactions" do
      customer = Transaction.first

      get "/api/v1/transactions/#{customer.id}/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a transactions favorite merchant" do
      customer = Transaction.first

      get "/api/v1/transactions/#{customer.id}/favorite_merchant"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
