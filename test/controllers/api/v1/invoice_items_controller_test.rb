require_relative './../../test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionDispatch::IntegrationTest
    test "can find all invoice_items" do

      get "/api/v1/invoice_items"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoice_items invoices" do
      customer = InvoiceItem.first

      get "/api/v1/invoice_items/#{customer.id}/invoices"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoice_items transactions" do
      customer = InvoiceItem.first

      get "/api/v1/invoice_items/#{customer.id}/transactions"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end

    test "can find a invoice_items favorite invoice_item" do
      customer = InvoiceItem.first

      get "/api/v1/invoice_items/#{customer.id}/favorite_invoice_item"
      assert_response :success

      items = JSON.parse(response.body)
      assert_equal items.count, 2
    end
end
