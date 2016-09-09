require_relative '../../../test_helper'

class Api::V1::Items::ItemsLogicTest < ActionDispatch::IntegrationTest
  test "can get random item" do

    get "/api/v1/items/random"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find item by primary key" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find?id=#{item_1.id}"
    assert_response :success

    item_2_data = get "/api/v1/items/find?id=#{item_2.id}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find item by name" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find?created_at=#{item_1.name}"
    assert_response :success

    item_2_data = get "/api/v1/items/find?name=#{item_2.name}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find item by created at" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find?created_at=#{item_1.created_at}"
    assert_response :success

    item_2_data = get "/api/v1/items/find?name=#{item_2.created_at}"
    assert_response :success

    # items = JSON.parse(response.body)
    # assert_equal items.count, 2
  end

  test "can find item by updated at" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find?created_at=#{item_1.updated_at}"
    assert_response :success

    item_2_data = get "/api/v1/items/find?name=#{item_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all items by primary key" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find_all?id=#{item_1.id}"
    assert_response :success

    item_2_data = get "/api/v1/items/find_all?id=#{item_2.id}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all items by name" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find_all?name=#{item_1.name}"
    assert_response :success

    item_2_data = get "/api/v1/items/find_all?name=#{item_2.name}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all items by created at" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find_all?created_at=#{item_1.created_at}"
    assert_response :success

    item_2_data = get "/api/v1/items/find_all?created_at=#{item_2.created_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find all items by updated at" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/find_all?created_at=#{item_1.updated_at}"
    assert_response :success

    item_2_data = get "/api/v1/items/find_all?name=#{item_2.updated_at}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an item merchant" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/#{item_1.id}/merchant"
    assert_response :success

    item_2_data = get "/api/v1/items/#{item_2.id}/merchant"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find an items invoice_items" do
    item_1 = Item.first
    item_2 = Item.second

    item_1_data = get "/api/v1/items/#{item_1.id}/item_items"
    assert_response :success

    item_2_data = get "/api/v1/items/#{item_2.id}/item_items"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can find top x items ranked by total number" do
    x = 3

    item_1_data = get "/api/v1/items/most_items?quantity=#{x}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can return the top x items ranked by total revenue generated" do
    x = 3

    item_1_data = get "/api/v1/items/most_revenue?quantity=#{x}"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end

  test "can return the date with most sales for specific item" do
    item = Item.first

    item_1_data = get "/api/v1/items/#{item.id}/best_day"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end
end
