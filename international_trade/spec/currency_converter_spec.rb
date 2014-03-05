require 'currency_converter'

describe CurrencyConverter do 
  let (:transactions) {[{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD}]}

  it "returns 0.7439 to when converting from AUD to CAD" do 
    test_rates = {:AUD => {:CAD => 1.0079} }
    currency_converter = CurrencyConverter.new(test_rates, transactions)

    currency_converter.conversion_rate("AUD", "CAD", []).should == [1.0079]
  end

  it "indirectly converts AUD to USD" do 
    test_rates = {:AUD=> {:CAD=>1.0079}, :CAD=>{:USD => 1.0090}}
    currency_converter = CurrencyConverter.new(test_rates, transactions)

    currency_converter.conversion_rate("AUD", "USD", []).should == (1.0079 * 1.009)
  end

  it "converts 19.68 AUD to 19.87 USD to 20.013991248" do 
    currency_converter.convert(transactions, :AUD, :USD).should == 20.013991248 
  end
end