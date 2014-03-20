require 'user_factory'
require 'user'
require 'tweet_factory'
require 'tweet'
require 'mutual_mentions_factory'

describe UserFactory do 
  before :each do
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava\n",
                   "spambot: hey @ava\n"]

    @test_tweets = TweetFactory.new(test_tweets).create_tweets
    @test_users = ["ava", "bob", "spambot"]

  end
  
  it "creates users" do 
    user_factory = UserFactory.new(@test_users, @test_tweets)

    user_factory.create_users.count.should == 3
  end
end