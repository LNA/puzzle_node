require 'connection_factory'
require 'user'
require 'tweet'
require 'tweet_factory'
require 'user_factory'
require 'mutual_mentions_factory'
require 'user_factory'

describe ConnectionFactory do 
   before :each do
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava @ike \n",
                   "ike: hey @bob @gia \n",
                   "gia: hey @ike\n"]

    @test_tweets = TweetFactory.new(test_tweets).create_tweets
    @test_users = ["ava", "bob", "ike", "gia"]
    
    @user_factory = UserFactory.new(@test_users, @test_tweets)
    @users = @user_factory.create_users
  end
 
  let(:factory) { ConnectionFactory.new(@users) }

  it "creates a connection has for ava" do 
    factory.connections.should == { "ava" => {"level 1" =>["bob"]}, 
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