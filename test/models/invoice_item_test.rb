require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase
  test "associationed with item" do
    items = Invoice.first.items

    assert items.is_a?(Array)
  end

  # test "associated with invoice" do
  #   require 'pry'; binding.pry
  #   invoice = Invoice.first.invoices
  #   assert invoice.is_a?(Array)
  # end
end
