require 'user'
require 'tweet_factory'

describe User do 
  before :each do
    test_tweets = ["alberta: @bob \"It is remarkable, the character of the pleasure we derive from the best books.\"\n",
                   "bob: \"They impress us ever with the conviction that one nature wrote and the same reads.\" /cc @alberta\n",
                   "alberta: hey @christie. what will we be reading at the book club meeting tonight?\n",
                   "christie: 'Every day, men and women, conversing, beholding and beholden.' /cc @alberta, @bob\n"]
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

  it "returns 2 as the number of received tweets" do 
    @user.received_tweets.count.should == 2
  end

  it "returns 4 as the number of tweets involving user" do 
    @user.tweets_involving_user.count.should == 4
  end
end