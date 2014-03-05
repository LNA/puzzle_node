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

  # def convert_to_float
  #   @transactions = output_transactions_for_sku
  #   @transactions.each do |t|
  #     t[:amount] = t[:amount].to_f
  #   end
  #   @transactions 
  # end

  # def total_sales_for_sku
  #   require 'pry'
  #   binding.pry
  #   @total = @usd_transactions.inject(0) {|sum, hash| sum + hash[:amount]}
  #   @total = @total.to_i
  # end

  # def total_after_bankers_rounding
  #   if @total.even?
  #     @total 
  #   else
  #     @total = (@total - 0.5)
  #   end
  #   @total
  # end
end