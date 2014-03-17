require 'user'
require 'tweet_factory'

describe User do 
  before :each do
    test_tweets = ["alberta: @bob \"It is remarkable, the character of the pleasure we derive from the best books.\"\n",
                   "bob: \"They impress us ever with the conviction that one nature wrote and the same reads.\" /cc @alberta\n",
                   "alberta: hey @christie. what will we be reading at the book club meeting tonight?\n",
                   "christie: 'Every day, men and women, conversing, beholding and beholden.' /cc @alberta, @bob\n"]
    @test_tweets = TweetFactory.new(test_tweets).create_tweets
  end

  let (:user) {User.new("alberta")}

  it "has a name" do 
    user.name.should == "alberta"
  end  

  it "has tweets" do 
    user.sent(@test_tweets)

    user.sent_tweets.count.should == 2
  end
end