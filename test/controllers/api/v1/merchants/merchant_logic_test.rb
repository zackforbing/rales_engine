require 'test_helper'

class Api::V1::Merchants::MerchantsLogicTest < ActionDispatch::IntegrationTest
  test "can get random merchant" do

    get "/api/v1/merchants/random"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find merchant by primary key" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find?id=#{merchant_1.id}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find?id=#{merchant_2.id}"
    assert_response :success

    # merchants = JSON.parse(response.body)
    # assert_equal merchants.count, 2
  end

  test "can find merchant by name" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find?created_at=#{merchant_1.name}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find?name=#{merchant_2.name}"
    assert_response :success

    # merchants = JSON.parse(response.body)
    # assert_equal merchants.count, 2
  end

  test "can find merchant by created at" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find?created_at=#{merchant_1.created_at}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find?name=#{merchant_2.created_at}"
    assert_response :success

    # merchants = JSON.parse(response.body)
    # assert_equal merchants.count, 2
  end

  test "can find merchant by updated at" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find?created_at=#{merchant_1.updated_at}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find?name=#{merchant_2.updated_at}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find all merchants by primary key" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find_all?id=#{merchant_1.id}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find_all?id=#{merchant_2.id}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find all merchants by name" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find_all?name=#{merchant_1.name}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find_all?name=#{merchant_2.name}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find all merchants by created at" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find_all?created_at=#{merchant_2.created_at}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find all merchants by updated at" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/find_all?created_at=#{merchant_1.updated_at}"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/find_all?name=#{merchant_2.updated_at}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find an merchants items" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/#{merchant_1.id}/items"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/#{merchant_2.id}/items"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find an merchants invoices" do
    merchant_1 = Merchant.first
    merchant_2 = Merchant.second

    merchant_1_data = get "/api/v1/merchants/#{merchant_1.id}/invoices"
    assert_response :success

    merchant_2_data = get "/api/v1/merchants/#{merchant_2.id}/invoices"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can find a merchants revenue" do
    merchant = Merchant.first

    merchant_1_data = get "/api/v1/merchants/#{merchant.id}/revenue"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can return the top x merchants ranked by total number of items sold" do
    x = 3

    merchant_1_data = get "/api/v1/merchants/most_items?quantity=#{x}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can return a merchants customers with pending invoices" do
    merchant = Merchant.first

    merchant_1_data = get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can return a merchants favorite customer" do
    merchant = Merchant.first

    merchant_1_data = get "/api/v1/merchants/#{merchant.id}/favorite_customer"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can return the total revenue for date x across all merchants" do
    x = 3

    merchant_1_data = get "/api/v1/merchants/revenue?date=#{x}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end

  test "can return the top x merchants ranked by total revenue" do
    x = 3

    merchant_1_data = get "/api/v1/merchants/most_revenue?quantity=#{x}"
    assert_response :success

    merchants = JSON.parse(response.body)
    assert_equal merchants.count, 2
  end
end
