$: << File.expand_path(File.dirname(__FILE__) + "/../data/")
require 'csv'
require 'nokogiri'

Parses each file
Finds the necessary transactions
Converts them all down to USD
gets the total
rounds the total with bankers rounding
Returns the number

parser = FileParser.new
transactions = parser.parse_file_by_type('data/sample_trans.csv')
rates = parser.parse_file_by_type('data/sample_rates.xml')  

finder = TransactionFinder.new(transactions, :DM1182)
transactions_filtered_by_sku = finder.output_transactions_for_sku

currency_converter = CurrencyConverter.new(rates, transactions_filted_by_sku)