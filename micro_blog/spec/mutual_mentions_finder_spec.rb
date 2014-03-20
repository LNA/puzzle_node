require 'mutual_mentions_finder'
require 'tweet_factory'
require 'tweet'
require 'user'

describe MutualMentionsFinder do 
  before :each do
    tweets = ["ava: @bob \"remarkable.\"\n",
                   "bob: \"reads.\" /cc @ava @ike \n",
                   "ike: hey @bob @gia \n",
                   "gia: hey @ike\n"]

    tweet_factory = TweetFactory.new
    @test_tweets  = tweets.map { |tweet| tweet_factory.create(tweet)}
    @ike = User.new("ike")

  end

  let (:mentions) { MutualMentionsFinder.new(@test_tweets) }

  it "returns 1 as the number of sent tweets" do 
    mentions.sent(@ike.name).count.should == 1
  end

  it "returns 2 as the number of received tweets" do 
    mentions.received(@ike.name)

    mentions.tweets_received.count.should == 2
  end

  it "returns the names of users tweeted to" do 
    mentions.sent(@ike.name)

    mentions.users_tweeted_to.should == ["bob", "gia"]
  end

  it "returns the names of users tweeted from" do 
    mentions.received(@ike.name)

    mentions.received_tweets_from.should == ["bob", "gia"]
  end


  it "finds the mutual mentions for user" do 
   mentions.find_mutual_mentions_for(@ike).should == ["bob", "gia"]
  end
end