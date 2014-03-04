$: << File.expand_path(File.dirname(__FILE__) + "/../data/")
require 'csv'
require 'nokogiri'

class SalesConverter
  attr_accessor :rates, :transactions 

  def initialize(parsed_xml_file, parsed_csv_file, sku, wanted_conversion_rate)
    @rates = parsed_xml_file
    @transactions = parsed_csv_file
    @sku = sku
    @wanted_conversion_rate = wanted_conversion_rate
  end

  def output_transactions_for_sku
    @transactions.find_all {|t| t[:sku] == @sku}
  end

  def convert_to_float
    @transactions = output_transactions_for_sku
    @transactions.each do |t|
      t[:amount] = t[:amount].to_f
    end
    @transactions 
  end

  def total_sales_for_item_in_USD_after_bankers_rounding
    total = @usd_transactions.inject(0) {|sum, hash| sum + hash[:amount]}
    total = total.to_i
    if total.even?
      total 
    else
      total = (total - 0.5)
    end
    total
  end
end