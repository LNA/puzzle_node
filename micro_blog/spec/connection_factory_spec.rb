require 'connection_factory'
require 'user'

describe ConnectionFactory do 
  let(:ava) {User.new("ava", ["bob", "jim"] )}
  let(:bob) {User.new("bob", ["ava", "ike"] )}
  let(:ike) {User.new("ike", ["bob", "gia"] )}
  let(:gia) {User.new("gia", ["ike"] )}

  let (:second_level_factory) { ConnectionFactory.new([ava, bob, ike])}

  let (:second_level) { {"ava"=>{"level 1" =>["bob", "jim"], 
                                 "level 2" =>["ike"]}, 

                        "bob"=>{"level 1" =>["ava", "ike"]}, 

                        "ike"=>{"level 1" =>["bob"], 
                                "level 2" =>["ava"]} }}


  it "creates a connection has for ava" do 
    second_level_factory.connections.should == { "ava" => {"level 1" =>["bob", "jim"]}, 
                                                 "bob" => {"level 1" =>["ava", "ike"]}, 
                                                 "ike" => {"level 1" =>["bob", "gia"]} }
  end


  it "returns a third level factory" do 
    thrird_level_factory = ConnectionFactory.new([ava, bob, ike, gia])
    thrird_level_factory.connections

    thrird_level_factory.add_connection_level.should == {"ava"=>{"level 1" =>["bob", "jim"], 
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