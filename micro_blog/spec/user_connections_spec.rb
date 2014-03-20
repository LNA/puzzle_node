require 'user_connections'
require 'user'
require 'tweet'
require 'tweet_factory'
require 'users'
require 'mutual_mentions_finder'

describe UserConnections do 
   before :each do
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava @ike \n",
                   "ike: hey @bob @gia \n",
                   "gia: hey @ike\n"]

    tweet_factory = TweetFactory.new
    @tweets = test_tweets.map { |tweet| tweet_factory.create(tweet)}

    @test_users = ["ava", "bob", "ike", "gia"]
    
    @users = Users.new.create(@test_users)
  end
 
  let(:factory) { UserConnections.new(@users, @tweets) }

  it "creates a connection has for ava" do 
    factory.connections.should == { "ava" => {"level 1" =>["bob"]}, 
                                    "bob" => {"level 1" =>["ava", "ike"]}, 
                                    "ike" => {"level 1" =>["bob", "gia"]},
                                    "gia" => {"level 1" =>["ike"]}}
  end

  it "creates connections when a user has no mutual mentions" do 
     test_tweets = ["ava: \"remarkable.\"\n",
                   "bob: \"reads.\" @ike \n",
                   "ike: @bob \n"]
                   

    tweet_factory = TweetFactory.new
    tweets = test_tweets.map { |tweet| tweet_factory.create(tweet)}

    test_users = ["ava", "bob", "ike"]
    
    users = Users.new.create(test_users)

    factory = UserConnections.new(users, tweets)

    factory.connections.should == { "ava" => {"level 1" =>[]}, 
                                    "bob" => {"level 1" =>["ike"]}, 
                                    "ike" => {"level 1" =>["bob"]}}
  end
                                   

  it "has a second level connection" do 
    test_tweets = ["ava: @bob \"hi\"\n",
                   "bob: \"hi.\" @ava @ike \n",
                   "ike: @bob\n" ]

    test_users = ["ava", "bob", "ike"]

    tweet_factory = TweetFactory.new
    tweets = test_tweets.map { |tweet| tweet_factory.create(tweet)}

    users = Users.new.create(test_users)

    two_level = UserConnections.new(users, tweets)

    two_level.connections
    two_level.add_connection_level.should == {"ava"=>{"level 1"=>["bob"], 
                                                      "level 2"=>["ike"]}, 

                                              "bob"=>{"level 1"=>["ava", "ike"]}, 
                                              "ike"=>{"level 1"=>["bob"], 

                                                      "level 2"=>["ava"]}}
  end

  it "returns a third level factory" do 
    factory.connections

    factory.add_connection_level.should == {"ava"=>{"level 1" =>["bob"], 
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