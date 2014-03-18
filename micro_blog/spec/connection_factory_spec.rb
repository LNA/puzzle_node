require 'connection_factory'

describe ConnectionFactory do 
  let (:first_level_connections) {{ "ava" => ["bob", "chr"],
                                    "bob" => ["ava", "jen"], 
                                    "jen" => ["bob", "see"] }}

  let (:connection_factory) {ConnectionFactory.new(first_level_connections)}

  it "creates a hash object" do 
    connection_factory.second_level_connections("ava", "jen").should == ["ava", "jen"]
  end
end