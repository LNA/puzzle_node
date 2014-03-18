require 'connection_factory'

describe ConnectionFactory do 
  let (:factory) {ConnectionFactory.new("ava", ["bob", "jim"], ["ava", "bee"], ["al"]) }
  let (:first_level)  { { "ava" => { :mutual_mentions => [ "bob", "jim"]} } }
  let (:second_level) { { "ava" => { :mutual_mentions => ["bob", "jim"], :second_level_connections => ["bee"] }}}


  it "creates a connection has for ava" do 
    factory.connections.should == first_level
  end

  it "returns the second level connections for ava" do
    factory.add_connection_level(first_level).should == second_level
  end

  it "retruns the third level connection for ava" do 
    factory.add_connection_level(first_level).should == { "ava" => { :mutual_mentions => ["bob", "jim"], 
                                                                     :second_level_connections => ["bee"] },
                                                                     :third_level_connection => ["al"]}
  end
end