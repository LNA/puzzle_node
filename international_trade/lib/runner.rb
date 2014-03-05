$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

parser = FileParser.new
transactions = parser.parse_file_by_type('data/sample_trans.csv')
rates = parser.parse_file_by_type('data/sample_rates.xml')    

finder = TransactionFinder.new(transactions, :DM1182)
transactions_filtered_by_sku = finder.output_transactions_for_sku

currency_converter = CurrencyConverter.new(rates, transactions_filtered_by_sku)