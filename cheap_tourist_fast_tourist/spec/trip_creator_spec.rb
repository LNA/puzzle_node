require 'trip_creator'
require 'trip'

describe TripCreator do 
  let (:test_data)  {[["A", "B", "09:00", "10:00", "100.00"],
                      ["B", "C", "10:00", "11:00", "75.00"],
                      ["B", "Z", "15:00", "16:30", "250.00"]]}
  let (:creator) {TripCreator.new(test_data)}

  it "returns flights with attributes" do 
    trips = creator.create_trips
    
    trips.first.should be_an_instance_of(Trip)
  end
end