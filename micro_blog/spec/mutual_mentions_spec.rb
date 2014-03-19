require 'mutual_mentions'
require 'tweet_factory'
require 'tweet'

describe MutualMentions do 
  before :each do
    test_tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava\n",
                   "spambot: hey @ava\n"]

    @test_tweets = TweetFactory.new(test_tweets).create_tweets
  end

  let (:mentions) { MutualMentions.new("ava", @test_tweets) }

  it "returns 1 as the number of sent tweets" do 
    mentions.sent.count.should == 1
  end

  it "returns 2 as the number of received tweets" do 
    mentions.received.count.should == 2
  end

  it "returns the names of users tweeted to" do 
    mentions.sent

    mentions.users_tweeted_to.should == ["bob"]
  end

  it "returns the names of users tweeted from" do 
    mentions.received 

    mentions.received_tweets_from.should == ["bob", "spambot"]
  end


  it "returns the users interacting with" do 
    mentions.sent
    mentions.received
    mentions.users_tweeted_to
    mentions.received_tweets_from
   
   mentions.mutual_mentions.should == ["bob"]
  end
end