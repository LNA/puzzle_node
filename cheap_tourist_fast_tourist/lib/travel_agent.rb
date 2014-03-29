class TravelAgent
  def initialize(trips)
    @trips = trips 
  end

  def order_trips_by_price
    trips_by_price = @trips.sort_by { |trip| trip.price }
  end

  def order_trips_by_length
    trips_by_length = @trips.sort_by { |trip| trip.length }
  end
end