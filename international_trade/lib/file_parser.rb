class FileParser
  def parse_xml_rates(file)
    @rates = {}

    Nokogiri::XML(File.open(file)).css('rate').each do |rate|
     original_dollar_rate = rate.css('from').text.to_sym
     @rates[original_dollar_rate] ||= [] # if key isn't assigned a value set it equal to []
     @rates[original_dollar_rate] << rate.css('to').text.to_sym
     @rates[original_dollar_rate] << rate.css('conversion').text.to_f
    end
    @rates
  end

  def parse_csv_transactions(file)
    @transactions = []

    CSV.foreach(file, :headers => true) do |row|
      amount, currency = row['amount'].split
      @transactions << { store: row['store'].to_sym, sku: row['sku'].to_sym, amount: amount, currency: currency.to_sym }
    end
    @transactions
  end

   def parse_file_by_type(file)
    if file[-3] == "x"
      parse_xml_rates(file)
    else
      parse_csv_transactions(file)
    end
  end
end