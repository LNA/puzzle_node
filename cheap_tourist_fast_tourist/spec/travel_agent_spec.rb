require 'travel_agent'
describe TravelAgent do 
  let (:test_data)  {[["A", "B", "09:00", "10:00", "100.00"],
                      ["B", "C", "10:00", "11:00", "75.00"],
                      ["B", "Z", "15:00", "16:30", "250.00"]]}
  let (:trips) {TripCreator.new(test_data).create_trips}
  let (:agent) {TravelAgent.new(trips)}

  it "returns the trips in order by price" do 
    agent.order_trips_by_price.should  "a"
  end
end