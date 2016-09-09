require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "#favorite_merchant" do
    customer = Customer.first

    assert_equal "__" ,customer.favorite_merchant
  end

  test "associated with invoices" do
    invoices = Customer.first.invoices

    assert invoices.is_a?(Array)
  end

  test "associated with transactions" do
    transactions = Customer.first.transactions

    assert transactions.is_a?(Array)
  end

  test "associated with merchants" do
    merchants = Customer.first.merchants

    assert merchants.is_a?(Array)
  end
end
