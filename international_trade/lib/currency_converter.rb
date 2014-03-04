class CurrencyConverter

  def initialize(rates)
    @rates = rates
  end

  def conversion_rate(from, to)
    converstion_rate = @rates[from][to]

    if !converstion_rate
      indirect_conversion(from,to)
    else
      conversion_rate
    end
  end
end