class Trip
  attr_accessor :arrival_city, :arrival_time, 
                :departure_city, :departure_time,
                :id

  def initialize(trip)
    @trip = trip
  end
end