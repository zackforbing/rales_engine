require 'test_helper'

class Api::V1::Transactions::TransactionsLogicTest < ActionDispatch::IntegrationTest
  test "can get random transaction" do

    get "/api/v1/transactions/random"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find transaction by primary key" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find?id=#{transaction_1.id}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find?id=#{transaction_2.id}"
    assert_response :success

    # transactions = JSON.parse(response.body)
    # assert_equal transactions.count, 2
  end

  test "can find transaction by name" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find?created_at=#{transaction_1.name}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find?name=#{transaction_2.name}"
    assert_response :success

    # transactions = JSON.parse(response.body)
    # assert_equal transactions.count, 2
  end

  test "can find transaction by created at" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find?created_at=#{transaction_1.created_at}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find?name=#{transaction_2.created_at}"
    assert_response :success

    # transactions = JSON.parse(response.body)
    # assert_equal transactions.count, 2
  end

  test "can find transaction by updated at" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find?created_at=#{transaction_1.updated_at}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find?name=#{transaction_2.updated_at}"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find all transactions by primary key" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find_all?id=#{transaction_1.id}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find_all?id=#{transaction_2.id}"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find all transactions by name" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find_all?name=#{transaction_1.name}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find_all?name=#{transaction_2.name}"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find all transactions by created at" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find_all?created_at=#{transaction_2.created_at}"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find all transactions by updated at" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/find_all?created_at=#{transaction_1.updated_at}"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/find_all?created_at=#{transaction_2.updated_at}"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end

  test "can find an transactions invoices" do
    transaction_1 = Transaction.first
    transaction_2 = Transaction.second

    transaction_1_data = get "/api/v1/transactions/#{transaction_1.id}/invoices"
    assert_response :success

    transaction_2_data = get "/api/v1/transactions/#{transaction_2.id}/invoices"
    assert_response :success

    transactions = JSON.parse(response.body)
    assert_equal transactions.count, 2
  end
end
