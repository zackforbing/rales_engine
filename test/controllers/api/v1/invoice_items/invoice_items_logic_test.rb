require_relative '../../../test_helper'

class Api::V1::InvoiceItems::InvoiceItemsLogicTest < ActionDispatch::IntegrationTest
  test "can get random invoice item" do

    get "/api/v1/invoice_items/random"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find invoice_item by primary key" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find?id=#{invoice_item_2.id}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice_item by name" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.name}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find?name=#{invoice_item_2.name}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice_item by created at" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find?name=#{invoice_item_2.created_at}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice_item by updated at" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.updated_at}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find?name=#{invoice_item_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoice_items by primary key" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find_all?id=#{invoice_item_1.id}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find_all?id=#{invoice_item_2.id}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoice_items by name" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find_all?name=#{invoice_item_1.name}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find_all?name=#{invoice_item_2.name}"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoice_items by created at" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.created_at}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_2.created_at}"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoice_items by updated at" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.updated_at}"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/find_all?name=#{invoice_item_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoice items invoice" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/#{invoice_item_1.updated_at}/invoice"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/#{invoice_item_2.updated_at}/invoice"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoice items item" do
    invoice_item_1 = InvoiceItem.first
    invoice_item_2 = InvoiceItem.second

    invoice_item_1_data = get "/api/v1/invoice_items/#{invoice_item_1.id}/item"
    assert_response :success

    invoice_item_2_data = get "/api/v1/invoice_items/#{invoice_item_2.id}/item"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end
end
