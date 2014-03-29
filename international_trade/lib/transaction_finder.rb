$: << File.expand_path(File.dirname(__FILE__) + "/../data/")
require 'csv'
require 'nokogiri'

class TransactionFinder
  attr_accessor :rates, :transactions, :total

  def initialize(parsed_csv_file, sku)
    @transactions = parsed_csv_file
    @sku = sku
  end

  def output_transactions_for_sku
    @transactions.find_all {|t| t[:sku] == @sku}
  end
end