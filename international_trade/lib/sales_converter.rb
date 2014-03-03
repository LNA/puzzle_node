$: << File.expand_path(File.dirname(__FILE__) + "/../data/")
require 'csv'
require 'nokogiri'

class SalesConverter
  FIND_SKU = :DM1182

  def initialize(csv_file, xml_file)
    @csv_file = csv_file
    @xml_file = xml_file
    @transactions = []
    @rates = {}
    @usd_transactions = []
  end
 
  def convert_csv
    CSV.foreach(@csv_file, :headers => true) do |row|
      amount, currency = row['amount'].split
      @transactions << { store: row['store'].to_sym, sku: row['sku'].to_sym, amount: amount, currency: currency.to_sym }
    end
    @transactions
  end

  def convert_rates
    @rates = {}

    Nokogiri::XML(File.open(@xml_file)).css('rate').each do |rate|
     original_dollar_rate = rate.css('from').text.to_sym
     @rates[original_dollar_rate] ||= [] # if key isn't assigned a value set it equal to []
     @rates[original_dollar_rate] << [rate.css('to').text.to_sym, rate.css('conversion').text.to_f]
    end
  end

  def output_transactions_for(sku_symbol)
    @transactions.find_all {|t| t[:sku] == sku_symbol}
  end

  def convert_to_float
    @transactions = output_transactions_for(FIND_SKU)
    @transactions.each do |t|
      t[:amount] = t[:amount].to_f
    end
    @transactions 
  end

  def convert_to_usd

    @transactions = convert_to_float

    @transactions.each do |transaction|
      while transaction[:currency] != :USD 
        transaction[:amount] = transaction[:amount] * @rates[transaction[:currency]][0][1]
        transaction[:currency] =  @rates[transaction[:currency]][0][0] 
      end
      @usd_transactions << transaction
    end
    @usd_transactions
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