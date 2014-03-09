require 'travel_agent'
require 'trip_creator'
describe TravelAgent do 
  let (:test_data)  {[["A", "B", "09:00", "10:00", "100.00"],
                      ["B", "C", "10:00", "11:00", "75.00"],
                      ["B", "Z", "15:00", "16:30", "250.00"]]}
  let (:trips) {TripCreator.new(test_data).create_trips}
  let (:agent) {TravelAgent.new(trips)}

  it "returns the cheapest trip" do 
    trip_order = agent.order_trips_by_price
    first_trip = trip_order.first

    first_trip.price.should == 75.0
  end

   it "returns the most expensive trip" do 
    trip_order = agent.order_trips_by_price
    last_trip = trip_order.last

    last_trip.price.should == 250.0
  end
end