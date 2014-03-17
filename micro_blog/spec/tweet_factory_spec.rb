require 'tweet_factory'
require 'tweet'

describe TweetFactory do 
  let (:test_tweets) {["alberta: @bob \"It is remarkable, the character of the pleasure we derive from the best books.\"",
                       ",bob: \"They impress us ever with the conviction that one nature wrote and the same reads.\" /cc @alberta",
                       ",alberta: hey @christie. what will we be reading at the book club meeting tonight?",
                       ",christie: 'Every day, men and women, conversing, beholding and beholden.' /cc @alberta, @bob"]}

  let (:tweet_factory) {TweetFactory.new(test_tweets)}
  it "creates tweeets" do 
    tweets = tweet_factory.create_tweets

    tweets.first.sender.should == "alberta"
  end
end