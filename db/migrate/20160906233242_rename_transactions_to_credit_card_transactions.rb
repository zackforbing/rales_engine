class RenameTransactionsToCreditCardTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_table :transactions, :credit_card_transactions
  end
end
