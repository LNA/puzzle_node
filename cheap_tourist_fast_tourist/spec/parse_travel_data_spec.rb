require 'parse_travel_data'

describe ParseTravelData do 
  let (:best_flight) {BestFlight.new('data/sample_input.txt')}
 
  let (:sample_data)  {["A B 09:00 10:00 100.00\n",
                        "B Z 11:30 13:30 100.00\n",
                        "A Z 10:00 12:00 300.00\n",
                        "A B 08:00 09:00 50.00\n",
                        "A B 12:00 13:00 300.00\n",
                        "A C 14:00 15:30 175.00\n",
                        "B C 10:00 11:00 75.00\n",
                        "B Z 15:00 16:30 250.00\n",
                        "C B 15:45 16:45 50.00\n",
                        "C Z 16:00 19:00 100.00"]}

  it "returns flights only" do 
    best_flight.return_flights('data/sample_input.txt').should == sample_data
  end

  it "splits the data" do 
    best_flight.split_flight_data.should == [["C", "Z", "16:00", "19:00", "100.00"], ["A", "C", "14:00", "15:30", "175.00"], ["C", "B", "15:45", "16:45", "50.00"]]
  end
end