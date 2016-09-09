require_relative './../../test_helper'

class Api::V1::InvoicesControllerTest < ActionDispatch::IntegrationTest
    test "can find all invoices" do

      get "/api/v1/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoices invoices" do
      invoice = Invoice.first

      get "/api/v1/invoices/#{invoice.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoices transactions" do
      invoice = Invoice.first

      get "/api/v1/invoices/#{invoice.id}/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoices favorite merchant" do
      invoice = Invoice.first

      get "/api/v1/invoices/#{invoice.id}/favorite_merchant"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
