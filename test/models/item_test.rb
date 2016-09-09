require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "associated with merchant" do
    merchant = Item.first.merchants

    assert merchant.is_a?(Array)
  end

  test "associated with invoice items" do
    invoice_items = Item.first.invoice_items

    assert invoice_items.is_a?(Array)
  end

  test "associated with invoices" do
    invoices = Item.first.invoices

    assert invoices.is_a?(Array)
  end
end
