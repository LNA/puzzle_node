require 'currency_converter'
require 'file_parser'
require 'transaction_finder'

describe CurrencyConverter do 
  let (:test_rates)  {{:AUD=> {:CAD=>1.0079}, :CAD=>{:USD => 1.0090}}}

  let (:sample_transactions) {[{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD},
                               {:store=>:Nashua,  :sku=>:DM1182, :amount=>"58.58", :currency=>:AUD}, 
                               {:store=>:Camden,  :sku=>:DM1182, :amount=>"54.64", :currency=>:USD}]}

  let (:currency_converter) {CurrencyConverter.new(test_rates, sample_transactions)}
  let (:conversion_rate) {currency_converter.change_conversion_rate("AUD", "USD")}

  it "indirectly converts AUD to USD" do 
    conversion_rate.should == (1.0079 * 1.009)
  end

  it "converts all transactions from the sample file" do 
    conversion_rate

    currency_converter.multiply_total_by_conversion_rate.should == 135.15545919
  end

  it "returns 135.16 for 135.15545919" do 
    conversion_rate 
    currency_converter.multiply_total_by_conversion_rate

    currency_converter.bankers_rounding.should == 135.16
  end

  it "returns the number for the real file" do 
    parser = FileParser.new
    transactions = parser.parse_file_by_type('data/trans.csv')
    rates = parser.parse_file_by_type('data/rates.xml')    

    finder = TransactionFinder.new(transactions, :DM1182)
    transactions_filtered_by_sku = finder.output_transactions_for_sku

    currency_converter = CurrencyConverter.new(rates, transactions_filtered_by_sku)
    currency_converter.change_conversion_rate("AUD", "USD")
    currency_converter.multiply_total_by_conversion_rate

    currency_converter.bankers_rounding.should ==  54803.0
  end
end