class TripCreator
  def initialize(parsed_travel_itineraries)
    @parsed_travel_itineraries = parsed_travel_itineraries
  end

  def create_trip
    count = 0

    @parsed_travel_itineraries.each do |itenerary| 
      trip = Hash.new
      trip["id"] = count + 1
      trip["departure_city"] = itenerary[0]
      trip["arrival_city"] = itenerary[1]
      trip["departure_time"] = itenerary[2]
      trip["arrival_time"] = itenerary[3]
      trip["price"] = itenerary[4].to_f
      require 'pry'
      binding.pry
    end
  end 
end