require 'trip_creator'

describe TripCreator do 
  let (:test_data)  {[["A", "B", "09:00", "10:00", "100.00"],
                      ["B", "C", "10:00", "11:00", "75.00"],
                      ["B", "Z", "15:00", "16:30", "250.00"]]}
  let (:creator) {TripCreator.new(test_data)}

  it "returns flights with attributes" do 
    require 'pry'
    binding.pry
    trips = creator.create_trips

    trips.first.id.should == 1
  end
end