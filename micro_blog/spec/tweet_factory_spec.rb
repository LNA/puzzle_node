require 'tweet_factory'
require 'tweet'

describe TweetFactory do 
  let (:test_tweets) {["ava: @bob @al\"remarkable.\"\n",
                       "bob: \"reads.\" /cc @ava @ike\n",
                       "spambot: hey @ava\n"]}

  let (:tweet_factory) {TweetFactory.new(test_tweets)}

  it "creates tweeets" do 
    tweets = tweet_factory.create_tweets

    tweets.first.sender.should == "ava"
  end

  it "returns multiple receivers" do 
    tweets = tweet_factory.create_tweets
    tweets.first.receiver.should == ["bob", "al"]
  end
end