class TravelAgent
  def initialize(trips)
    @trips = trips 
  end

  def order_trips_by_price
    trip_order_by_price = @trips.sort_by {|trip| trip.price}
  end
end