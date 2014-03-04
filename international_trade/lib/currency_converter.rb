class CurrencyConverter
  def initialize(rates)
    @rates = rates
  end

  def conversion_rate(from, to, partial_conversion_rates)
    @partial_conversion_rates = partial_conversion_rates
    to = to.to_sym
    from = from.to_sym

    if @rates[from].has_key?(to)
      @partial_conversion_rates << @rates[from].values
    else
      indirect_conversion(from, to, @partial_conversion_rates)
    end
    @partial_conversion_rates.flatten.inject(:*)
  end

  def indirect_conversion(from, to, partial_conversion_rates)
    @middleman_conversion_country = @rates[:AUD].keys.first

    @rates.each do |rate|
      if rate[1].has_key?(@middleman_conversion_country)
        @partial_conversion_rates << rate[1].values
      end
    end
    @partial_conversion_rates
    conversion_rate(@middleman_conversion_country, to, @partial_conversion_rates)
  end
end