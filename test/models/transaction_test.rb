require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "associated with invoice" do
    invoices = Transaction.first.invoices

    assert invoices.is_a?(Array)
  end
end
