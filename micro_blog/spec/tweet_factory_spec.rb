require 'tweet'
require 'tweet_factory'

describe TweetFactory do 
  let (:test_tweets) {["ava: @bob @al\"remarkable.\"\n",
                       "bob: \"reads.\" /cc @ava @ike\n",
                       "spambot: hey @ava\n"]}

  let (:tweet_factory) {TweetFactory.new}
  let (:tweets) { test_tweets.map { |tweet| tweet_factory.create(tweet)} }

  it "creates tweeets" do 
    tweets.first.sender.should == "ava"
  end

  it "returns multiple receivers" do 
    tweets.first.receivers.should == ["bob", "al"]
  end
end