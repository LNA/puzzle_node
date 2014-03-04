require 'file_parser'
require 'csv'
require 'nokogiri'

describe FileParser do 
  let (:csv_parser) {FileParser.new}
  let (:xml_parser) {FileParser.new}

  it "prints rates.xml" do   
    rates = xml_parser.parse_xml_rates('data/sample_rates.xml')  
  end

  it "prints the csv tansactions" do 
    transactions = csv_parser.parse_csv_transactions('data/sample_trans.csv')
  end

  it "picks the right parsing method to parse a xml file" do 
    xml_parser.parse_file_by_type('data/sample_rates.xml')
  end

  it "picks the right parsing method to parse a csv file" do 
    csv_parser.parse_file_by_type('data/sample_trans.csv')
  end
end