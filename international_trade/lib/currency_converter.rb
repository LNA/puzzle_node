class CurrencyConverter
  def initialize(rates, transactions_filted_by_sku)
    @rates = rates
    @transactions_filted_by_sku = transactions_filted_by_sku
    @partial_conversion_rates = []
  end

  def change_conversion_rate(from, to)
    to = to.to_sym
    from = from.to_sym

    if @rates[from].has_key?(to)
      @partial_conversion_rates << @rates[from].values
    else
      indirect_conversion(from, to)
    end
    @conversion_rate = @partial_conversion_rates.flatten.inject(:*)
  end

  def indirect_conversion(from, to)
    @middleman_conversion_country = @rates[from].keys.first

    @rates.each do |rate|
      if rate[1].has_key?(@middleman_conversion_country)
        @partial_conversion_rates << rate[1].values
      end
    end
    @partial_conversion_rates
    change_conversion_rate(@middleman_conversion_country, to)
  end

  def multiply_total_by_conversion_rate
    transaction_amounts = @transactions_filted_by_sku.map {|t| t[:amount].to_f}
    transaction_amounts = transaction_amounts.map {|amount| amount * @conversion_rate}
    @total = transaction_amounts.inject(:+)
  end

  def bankers_rounding
    @total = @total * 1000
    remainder_of_ten = (@total % 5)
    @total = @total.to_i
    if @total.even?
      @total 
    else
      @total += remainder_of_ten
    end
    @total = @total / 1000
    @total.round(2)
  end
end