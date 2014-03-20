require 'user_connections'
require 'user'
require 'tweet'
require 'tweet_factory'
require 'users'
require 'mutual_mentions_finder'

describe UserConnections do 
  #  before :each do
  #   test_tweets = ["ava: @bob \"remarkable.\"\n",
  #                  "bob: \"reads.\" /cc @ava @ike \n",
  #                  "ike: hey @bob @gia \n",
  #                  "gia: hey @ike\n"]

  #   @test_tweets = TweetFactory.new(test_tweets).create_tweets
  #   @test_users = ["ava", "bob", "ike", "gia"]
    
  #   @user_factory = UserFactory.new(@test_users, @test_tweets)
  #   @users = @user_factory.create_users
  # end
 
  # let(:factory) { UserConnections new(@users) }

  # it "creates a connection has for ava" do 
  #   factory.connections.should == { "ava" => {"level 1" =>["bob"]}, 
  #                                   "bob" => {"level 1" =>["ava", "ike"]}, 
  #                                   "ike" => {"level 1" =>["bob", "gia"]},
  #                                   "gia" => {"level 1" =>["ike"]}}
  # end

  it "has a second level connection" do 
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "ike: @ava\n" ]

    test_tweets = TweetFactory.new(test_tweets).create_tweets
    test_users = ["ava", "ike"]

    user_factory = UserFactory.new(test_users, test_tweets)
    users = user_factory.create_users

    two_level_factory = UserConnections new(users)

    two_level_factory.connections
    two_level_factory.add_connection_level.should == "s"
  end

  # it "returns a third level factory" do 
  #   factory.connections

  #   factory.add_connection_level.should == {"ava"=>{"level 1" =>["bob", "jim"], 
  #                                                   "level 2" =>["ike"],
  #                                                   "level 3" =>["gia"]}, 

  #                                           "bob"=>{"level 1" =>["ava", "ike"],
  #                                                   "level 2" =>["gia"]}, 

  #                                           "ike"=>{"level 1" =>["bob", "gia"], 
  #                                                   "level 2" =>["ava"]},

  #                                           "gia"=>{"level 1"=>["ike"], 
  #                                                   "level 2"=>["bob"], 
  #                                                   "level 3"=>["ava"]} } 
  # end
end