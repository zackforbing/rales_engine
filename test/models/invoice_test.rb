require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  test ".pending" do
    invoice_data = Invoice.pending
    assert_equal 1, invoice_data
  end

  test ".successful" do
    invoice_data = Invoice.successful
    assert_equal 1, invoice_data
  end

  test "associated with transactions" do
    transactions = Invoice.first.transactions

    assert transactions.is_a?(Array)
  end

  test "associated with invoice items" do
    invoice_items = Invoice.first.invoice_items

    assert invoice_items.is_a?(Array)
  end

  test "associated with items" do
    items = Invoice.first.items

    assert items.is_a?(Array)
  end

  test "belongs to merchant" do
    merchants = Invoice.first.merchant

    assert merchants.nil?
  end

  test "associated with customer" do
    customers = Invoice.first.customers

    assert customers.is_a?(Array)
  end
end
