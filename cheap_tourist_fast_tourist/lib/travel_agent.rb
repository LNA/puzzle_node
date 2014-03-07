class TravelAgent
  def initialize(trips)
    @trips = trips 
  end

  def order_trips_by_price
    require 'pry'
    binding.pry
    @trips.sort {|a, b| a <=> b if a.price > b.price  }
  end

  def order_flights_by_length
  end
end