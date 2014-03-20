require 'user'
require 'tweet_factory'
require 'mutual_mentions_factory'
require 'tweet'

describe User do

  before :each do
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava\n",
                   "spambot: hey @ava\n"]

    @test_tweets = TweetFactory.new(test_tweets).create_tweets
  end

  it "does something" do 
    user = User.new("ava", @test_tweets)
    
    user.mutual_mentions.find_mutual_mentions.should == ["bob"]
  end
end
