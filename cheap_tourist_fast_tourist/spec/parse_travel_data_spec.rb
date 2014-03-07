require 'parse_travel_data'

describe ParseTravelData do 
  let (:parser) {ParseTravelData.new('data/sample_input.txt')}
 
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
    parser.remove_extraneous_data.should == sample_data
  end

  it "splits the data" do 
    parser.remove_extraneous_data
    parser.split_travel_data.should == [["A", "B", "09:00", "10:00", "100.00"],
                                        ["B", "Z", "11:30", "13:30", "100.00"],
                                        ["A", "Z", "10:00", "12:00", "300.00"],
                                        ["A", "B", "08:00", "09:00", "50.00"],
                                        ["A", "B", "12:00", "13:00", "300.00"],
                                        ["A", "C", "14:00", "15:30", "175.00"],
                                        ["B", "C", "10:00", "11:00", "75.00"],
                                        ["B", "Z", "15:00", "16:30", "250.00"],
                                        ["C", "B", "15:45", "16:45", "50.00"],
                                        ["C", "Z", "16:00", "19:00", "100.00"]]
  end
end