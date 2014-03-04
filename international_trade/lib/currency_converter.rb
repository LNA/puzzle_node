class CurrencyConverter

  def initialize(rates)
    @rates = rates
  end

  def conversion_rate(from, to)
    to = to.to_sym
    from = from.to_sym

    if @rates[from][0] == to 
      converstion_rate = @rates[from][1]
    else
      indirect_conversion(from, to)
    end
    converstion_rate
  end

  def indirect_conversion(from, to)
    require 'pry'
    binding.pry

  end
end