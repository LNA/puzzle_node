require 'sales_converter'
require 'csv'
require 'nokogiri'
require 'bankers_rounding'


describe "SalesConverter" do 
  let (:sales_converter) {SalesConverter.new}

  it "prints the csv tansactions" do 
    transactions = sales_converter.convert_csv
  end

  it "prints rates.xml" do   
    rates = sales_converter.convert_rates  
  end

  it "outputs the total" do 
    sales_converter.convert_csv
    sales_converter.convert_rates

    sales_converter.output_transactions_for(:DM1182).should ==  [{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD}, 
                                                      {:store=>:Nashua,  :sku=>:DM1182, :amount=>"58.58", :currency=>:AUD},
                                                      {:store=>:Camden,  :sku=>:DM1182, :amount=>"54.64", :currency=>:USD}]
  end

  it "converts the first transaction to CAD from USD" do
    sales_converter.convert_csv
    sales_converter.convert_rates
    transactions = sales_converter.convert_to_usd

    transactions[0][:amount].should == 20.013991247999996
  end

  it "converts the second transaction to CAD from USD" do
    sales_converter.convert_csv
    sales_converter.convert_rates
    transactions = sales_converter.convert_to_usd

    transactions[1][:amount].should == 59.574167038
  end

  it "converts the third transaction to CAD from USD" do
    sales_converter.convert_csv
    sales_converter.convert_rates
    transactions = sales_converter.convert_to_usd

    transactions[2][:amount].should == 54.64
  end

  it "returns all converted transactions" do 
    sales_converter.convert_csv
    sales_converter.convert_rates

    sales_converter.convert_to_usd.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>20.013991247999996, :currency=>:USD},
                                              {:store=>:Nashua, :sku=>:DM1182, :amount=>59.574167038, :currency=>:USD},
                                              {:store=>:Camden, :sku=>:DM1182, :amount=>54.64, :currency=>:USD}]

  end

  it "returns the total sales amout for item in USD" do 
    sales_converter.convert_csv
    sales_converter.convert_rates
    sales_converter.convert_to_usd
    sales_converter.total_sales_for_item_in_USD_after_bankers_rounding.should == 134
  end
end
