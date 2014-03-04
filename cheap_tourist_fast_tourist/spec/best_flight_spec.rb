require 'best_flight'

describe "BestFlight" do 
  let (:best_flight) {BestFlight.new('data/sample_input.txt')}

  it "prints the sample_input file" do 
    best_flight.read_file
  end

  it "returns the first line of flight info" do 
    best_flight.return_first_flight('data/sample_input.txt').should ==    "A B 09:00 10:00 100.00"
  end
end