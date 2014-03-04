class CurrencyConverter

  def initialize(rates)
    @rates = rates
  end

  def conversion_rate(from, to)
    to = to.to_sym
    from = from.to_sym

    if @rates[from].has_key?(to)
      converstion_rate = @rates[from][:CAD]
    else
      indirect_conversion(from, to)
    end
    converstion_rate
  end

  def indirect_conversion(from, to)
    # ?
  end
end