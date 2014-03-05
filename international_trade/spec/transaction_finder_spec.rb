require 'sales_converter'
require 'file_parser'
require 'csv'
require 'nokogiri'

describe TransactionFinder do 
  let (:parsed_csv_file) {FileParser.new.parse_csv_transactions('data/sample_trans.csv')}
  let (:parsed_xml_file) {FileParser.new.parse_xml_rates('data/sample_rates.xml')}
  let (:finder) {TransactionFinder.new(parsed_xml_file, parsed_csv_file, :DM1182, :USD )}

  it "outputs transactions for USD" do 
    finder.output_transactions_for_sku.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD}, 
                                                  {:store=>:Nashua,  :sku=>:DM1182, :amount=>"58.58", :currency=>:AUD}, 
                                                  {:store=>:Camden,  :sku=>:DM1182, :amount=>"54.64", :currency=>:USD}]
  end

  it "converst the transactions to float" do 
    sales_converter.convert_to_float.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>19.68, :currency=>:AUD}, 
                                                {:store=>:Nashua, :sku=>:DM1182, :amount=>58.58, :currency=>:AUD}, 
                                                {:store=>:Camden, :sku=>:DM1182, :amount=>54.64, :currency=>:USD}]
  end

  it "returns the total sales for given sku" do 
    sales_converter.total_sales_for_sku.should == "s"
  end

  it "returns s for s after bankers rounding" do 
    sales_converter.bankers_rounding.should == "f"
  end
end