require_relative '../../../test_helper'

class Api::V1::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "can get all items in index" do

    get "/api/v1/customers/1/favorite_merchant"
    assert_response :success

    items = JSON.parse(response.body)
    assert_equal items.count, 2
  end
end
