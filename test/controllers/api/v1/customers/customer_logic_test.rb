require_relative '../../../test_helper'

class Api::V1::Customers::CustomersLogicTest < ActionDispatch::IntegrationTest
  test "can get random customer" do

    get "/api/v1/customers/random"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find customer by primary key" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find?id=#{customer_1.id}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find?id=#{customer_2.id}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find customer by name" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find?created_at=#{customer_1.name}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find?name=#{customer_2.name}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find customer by created at" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find?created_at=#{customer_1.created_at}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find?name=#{customer_2.created_at}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find customer by updated at" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find?created_at=#{customer_1.updated_at}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find?name=#{customer_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all customers by primary key" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find_all?id=#{customer_1.id}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find_all?id=#{customer_2.id}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all customers by name" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find_all?name=#{customer_1.name}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find_all?name=#{customer_2.name}"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all customers by created at" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find_all?created_at=#{customer_2.created_at}"
    assert_response :success
    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all customers by updated at" do
    customer_1 = Customer.first
    customer_2 = Customer.second

    customer_1_data = get "/api/v1/customers/find_all?created_at=#{customer_1.updated_at}"
    assert_response :success

    customer_2_data = get "/api/v1/customers/find_all?name=#{customer_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end
  # 
  # test "can find a customers invoices" do
  #   customer_1 = Customer.first
  #   customer_2 = Customer.second
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_1.id}/invoices"
  #   assert_response :success
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_2.id}/invoices"
  #   assert_response :success
  #
  #   items = JSON.parse(response.body)
  #   assert_equal items.count, 2
  # end
  #
  # test "can find a customers transactions" do
  #   customer_1 = Customer.first
  #   customer_2 = Customer.second
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_1.id}/transactions"
  #   assert_response :success
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_2.id}/transactions"
  #   assert_response :success
  #
  #   items = JSON.parse(response.body)
  #   assert_equal items.count, 2
  # end
  #
  # test "can find a customers favoriet merchant" do
  #   customer_1 = Customer.first
  #   customer_2 = Customer.second
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_1.id}/favorite_merchant"
  #   assert_response :success
  #
  #   customer_1_data = get "/api/v1/customers/#{customer_2.id}/favorite_merchant"
  #   assert_response :success
  #
  #   items = JSON.parse(response.body)
  #   assert_equal items.count, 2
  # end
end
