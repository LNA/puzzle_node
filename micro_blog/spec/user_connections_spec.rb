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
    tweets = test_tweets.map { |tweet| tweet_factory.create(tweet)}

    @test_users = ["ava", "bob", "ike", "gia"]
    
    @users = Users.new.create(@test_users)
    @mutual_mentions = MutualMentionsFinder.new(tweets)
  end
 
  let(:factory) { UserConnections.new(@users, @mutual_mentions) }

  it "creates a connection has for ava" do 
    factory.first_level_connections.should == { "ava" => {"level 1" =>["bob"]}, 
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
    mutual_mentions = MutualMentionsFinder.new(tweets)

    factory = UserConnections.new(users, mutual_mentions)

    factory.first_level_connections.should == { "ava" => {"level 1" =>[]}, 
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
    mutual_mentions = MutualMentionsFinder.new(tweets)

    two_level = UserConnections.new(users, mutual_mentions)

    two_level.first_level_connections
    two_level.add_connection_level.should == {"ava"=>{"level 1"=>["bob"], 
                                                      "level 2"=>["ike"]}, 

                                              "bob"=>{"level 1"=>["ava", "ike"]}, 
                                              "ike"=>{"level 1"=>["bob"], 

                                                      "level 2"=>["ava"]}}
  end

  it "returns a third level factory" do 
    factory.first_level_connections

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