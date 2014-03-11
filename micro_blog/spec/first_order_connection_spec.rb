require 'first_order_connection'

describe FirstOrderConnection do 
  let (:first_order_connection) {FirstOrderConnection.new('data/sample_input.txt')}

  it "returns all connections for Alberta" do 
    first_order_connection.tweets_involving("alberta").should == ["alberta: @bob \"It is remarkable, the character of the pleasure we derive from the best books.\"\n",
                                                                  "bob: \"They impress us ever with the conviction that one nature wrote and the same reads.\" /cc @alberta\n", 
                                                                  "alberta: hey @christie. what will we be reading at the book club meeting tonight?\n", 
                                                                  "christie: 'Every day, men and women, conversing, beholding and beholden.' /cc @alberta, @bob\n", 
                                                                  "alberta: @duncan, hope you're bringing those peanut butter chocolate cookies again :D\n"] 

  end

  it "returns albertas mutual mentions" do 
    first_order_connection.tweets_involving("alberta")
    

    first_order_connection.mutual_mentions_between("alberta", "bob").should == true
  end
end