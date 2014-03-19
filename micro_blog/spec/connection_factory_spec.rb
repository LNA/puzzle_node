require 'connection_factory'
require 'user'

describe ConnectionFactory do 
  let(:ava) {User.new("ava", ["bob", "jim"] )}
  let(:bob) {User.new("bob", ["ava", "ike"] )}
  let(:ike) {User.new("ike", ["bob", "gia"] )}
  let(:gia) {User.new("gia", ["ike"] )}
  let(:factory) {ConnectionFactory.new([ava, bob, ike, gia])}

  it "creates a connection has for ava" do 
    factory.connections.should == { "ava" => {"level 1" =>["bob", "jim"]}, 
                                                 "bob" => {"level 1" =>["ava", "ike"]}, 
                                                 "ike" => {"level 1" =>["bob", "gia"]},
                                                 "gia" => {"level 1" =>["ike"]}}
  end


  it "returns a third level factory" do 
    factory.connections

    factory.add_connection_level.should == {"ava"=>{"level 1" =>["bob", "jim"], 
                                                    "level 2" =>["ike"],
                                                    "level 3" =>["gia"]}, 

                                            "bob"=>{"level 1" =>["ava", "ike"],
                                                    "level 2" =>["gia"]}, 

                                            "ike"=>{"level 1" =>["bob", "gia"], 
                                                    "level 2" =>["ava"]},

                                            "gia"=>{"level 1"=>["ike"], 
                                                    "level 2"=>["bob"], 
                                                    "level 3"=>["ava"]} } 
  end
end