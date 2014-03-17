require 'user'
require 'tweet_factory'

describe User do 
  before :each do
    test_tweets = ["alberta: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @alberta\n",
                   "alberta: hey @christie.\n",
                   "spambot: hey @alberta\n",
                   "christie: 'Every day' /cc @alberta, @bob\n"]
    @test_tweets = TweetFactory.new(test_tweets).create_tweets
    @user = User.new("alberta")
    @user.sent(@test_tweets)
    @user.received(@test_tweets)
  end

  it "has a name" do 
    @user.name.should == "alberta"
  end  

  it "returns 3 as the number of sent tweets" do 
    @user.sent_tweets.count.should == 2
  end

  it "returns 3 as the number of received tweets" do 
    @user.received_tweets.count.should == 3
  end

  it "returns the names of users tweeted to" do 
    @user.users_tweeted_to.should == ["bob", "christie"]
  end

  it "returns the names of users tweeted from" do 
    @user.received_tweets_from.should == ["bob", "spambot", "christie"]
  end

  it "returns the users interacting with" do 
    @user.users_tweeted_to
    @user.received_tweets_from

    @user.interacting_with.should == ["bob", "christie", "bob", "spambot", "christie"]
  end
end