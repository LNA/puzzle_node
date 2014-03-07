require 'trip_creator'

describe TripCreator do 
  let (:test_data)  {[["A", "B", "09:00", "10:00", "100.00"],
                      ["B", "C", "10:00", "11:00", "75.00"],
                      ["B", "Z", "15:00", "16:30", "250.00"]]}
  let (:creator) {TripCreator.new(test_data)}

  it "returns the parsed trip data" do 
    creator = TripCreator.new(test_data)
  end

  it "returns flights with attributes" do 
    creator.create_trip.should == [{"departure_city"=>"A", "arrival_city"=>"B", "departure_time"=>"09:00", "arrival_time"=>"10:00", "price"=>100.00}, 
                                              {"departure_city"=>"B", "arrival_city"=>"C", "departure_time"=>"10:00", "arrival_time"=>"11:00", "price"=>75.00}, 
                                              {"departure_city"=>"B", "arrival_city"=>"Z", "departure_time"=>"15:00", "arrival_time"=>"16:30", "price"=>250.00}]
  end
end
