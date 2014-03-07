require 'trip'
class TripCreator
  def initialize(parsed_travel_itineraries)
    @parsed_travel_itineraries = parsed_travel_itineraries
  end

  def create_trips
    count = 1
    @trips = []

    @parsed_travel_itineraries.each do |itenerary| 
      trip = Trip.new
      trip.id = count
      trip.departure_city = itenerary[0]
      trip. arrival_city = itenerary[1]
      trip. departure_time = itenerary[2]
      trip.arrival_time = itenerary[3]
      trip.price = itenerary[4].to_f
      @trips << trip

      count += 1
    end
    @trips
  end 
end