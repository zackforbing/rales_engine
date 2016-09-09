require 'test_helper'

class Api::V1::Invoices::InvoicesLogicTest < ActionDispatch::IntegrationTest
  test "can get random invoice" do

    get "/api/v1/invoices/random"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find invoice by primary key" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find?id=#{invoice_1.id}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find?id=#{invoice_2.id}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice by name" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find?created_at=#{invoice_1.name}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find?name=#{invoice_2.name}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice by created at" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find?name=#{invoice_2.created_at}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find invoice by updated at" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find?created_at=#{invoice_1.updated_at}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find?name=#{invoice_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoices by primary key" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find_all?id=#{invoice_1.id}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find_all?id=#{invoice_2.id}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoices by name" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find_all?name=#{invoice_1.name}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find_all?name=#{invoice_2.name}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoices by created at" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find_all?created_at=#{invoice_2.created_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all invoices by updated at" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/find_all?created_at=#{invoice_1.updated_at}"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/find_all?name=#{invoice_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoice customer" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/#{invoice_1.id}/customer"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/#{invoice_2.id}/customer"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoices invoice_items" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/#{invoice_1.id}/invoice_items"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/#{invoice_2.id}/invoice_items"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoices items" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/#{invoice_1.id}/items"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/#{invoice_2.id}/items"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an invoices merchant" do
    invoice_1 = Invoice.first
    invoice_2 = Invoice.second

    invoice_1_data = get "/api/v1/invoices/#{invoice_1.id}/merchant"
    assert_response :success

    invoice_2_data = get "/api/v1/invoices/#{invoice_2.id}/merchant"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end
end
