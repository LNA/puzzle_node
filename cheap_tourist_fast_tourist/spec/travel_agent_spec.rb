require 'travel_agent'
require 'trip_creator'
require 'parse_travel_data'
require 'Time'

describe TravelAgent do 
  let (:parser) {ParseTravelData.new('data/input.txt')}

  it "returns the cheapest flight" do
    parsed_travel_itineraries = parser.clean_data
    trips = TripCreator.new(parsed_travel_itineraries).create_trips
    flights = TravelAgent.new(trips).order_trips_by_price

    flights.first.price.should == 90.71
  end

  it "returns the quickest flight" do
    parsed_travel_itineraries = parser.clean_data
    trips = TripCreator.new(parsed_travel_itineraries).create_trips
    flights = TravelAgent.new(trips).order_trips_by_length

    flights.first.length.should == 1740.0
  end
end