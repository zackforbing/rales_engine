require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach("csv data/customers.csv", headers: true, header_converters: :symbol) do |row|
  customer = Customer.create(first_name: row[:first_name],
                             last_name: row[:last_name],
                            created_at: row[:created_at],
                             updated_at: row[:updated_at])
  puts "#{customer.first_name} #{customer.last_name} created!"
end

CSV.foreach("csv data/merchants.csv", headers: true, header_converters: :symbol) do |row|
  merchant = Merchant.create(name: row[:name],
                             created_at: row[:created_at],
                             updated_at: row[:updated_at])
  puts "Merchant #{merchant.name} created!"
end

CSV.foreach("csv data/items.csv", headers: true, header_converters: :symbol) do |row|
  item = Item.create(name: row[:name],
                     description: row[:description],
                     unit_price: (row[:unit_price].to_i / 100.0),
                     merchant_id: row[:merchant_id],
                     created_at: row[:created_at],
                     updated_at: row[:updated_at])
  puts "Item #{item.name} created!"
end

CSV.foreach("csv data/invoices.csv", headers: true, header_converters: :symbol) do |row|
  invoice = Invoice.create(customer_id: row[:customer_id],
                           merchant_id: row[:merchant_id],
                           status: row[:status],
                           created_at: row[:created_at],
                           updated_at: row[:updated_at])
  puts "Invoice #{invoice.id} created!"
end

CSV.foreach("csv data/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
  invoice_item = InvoiceItem.create(item_id: row[:item_id],
                                    invoice_id: row[:invoice_id],
                                    quantity: row[:quantity],
                                    unit_price: (row[:unit_price].to_i / 100.0),
                                    created_at: row[:created_at],
                                    updated_at: row[:updated_at])
  puts "invoice_item ##{invoice_item.id} created!"
end

CSV.foreach("csv data/transactions.csv", headers: true, header_converters: :symbol) do |row|
  transaction = Transaction.create(invoice_id: row[:invoice_id],
                                   credit_card_number: row[:credit_card_number],
                                   result: row[:result],
                                   created_at: row[:created_at],
                                   updated_at: row[:updated_at])
  puts "transaction ##{transaction.id} created!"
end
