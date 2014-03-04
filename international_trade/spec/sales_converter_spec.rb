require 'sales_converter'
require 'file_parser'
require 'csv'
require 'nokogiri'

describe "SalesConverter" do 
  let (:parsed_csv_file) {FileParser.new.parse_csv_transactions('data/sample_trans.csv')}
  let (:parsed_xml_file) {FileParser.new.parse_xml_rates('data/sample_rates.xml')}
  let (:sales_converter) {SalesConverter.new(parsed_xml_file, parsed_csv_file)}

  it "outputs transactions for USD" do 
    sales_converter.output_transactions_for_sku.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD}, 
                                                                {:store=>:Nashua,  :sku=>:DM1182, :amount=>"58.58", :currency=>:AUD}, 
                                                                {:store=>:Camden,  :sku=>:DM1182, :amount=>"54.64", :currency=>:USD}]
  end

  it "converst the transactions to float" do 
    sales_converter.convert_to_float.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>19.68, :currency=>:AUD}, 
                                                {:store=>:Nashua, :sku=>:DM1182, :amount=>58.58, :currency=>:AUD}, 
                                                {:store=>:Camden, :sku=>:DM1182, :amount=>54.64, :currency=>:USD}]
  end
end