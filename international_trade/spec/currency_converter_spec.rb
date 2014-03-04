require 'currency_converter'

describe CurrencyConverter do 
  it "returns 0.7439 to when converting from AUD to EUR" do 
    test_rates = {:AUD=>[[:CAD, 1.0079]]}
    currency_converter = CurrencyConverter.new(test_rates)

    currency_converter.conversion_rate("AUD", "CAD").should == 1.0079
  end
end
