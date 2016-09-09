require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test ".revenue_by_date" do
    merchant_data = Merchant.revenue_by_date

    assert_equal "__" , merchant_data
  end

  test "#customers_with_pending_invoices" do
    merchant = Merchant.first

    result = ""

    assert_equal result, merchant.customers_with_pending_invoices
  end

  test "#favorite_customer" do
    merchant = Merchant.first

    result = ""

    assert_equal "__" , merchant.favorite_customer
  end

  test "#revenue" do
    merchant = Merchant.first

    assert_equal "__" , merchant.revenue
  end

  test ".most_revenue" do
    date = ""
    merchant_data = Merchant.most_revenue(date)

    result = ""

    assert_equal result , merchant_data
  end

  test "associated with items" do
    items = Merchant.first.items

    assert items.is_a?(Array)
  end

  test "associated with customer" do
    customers = Merchant.first.customers

    assert customers.is_a?(Array)
  end

  test "associated with invoice items" do
    invoice_items = Merchant.first.invoice_items

    assert invoice_items.is_a?(Array)
  end

  test "associated with transactions" do
    transactions = Merchant.first.transactions

    assert transactions.is_a?(Array)
  end
end
