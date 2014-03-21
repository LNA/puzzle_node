require 'mutual_mentions_finder'
require 'tweet'
require 'tweet_factory'
require 'user'

describe MutualMentionsFinder do 
  before :each do
    tweets = ["ava: \"remarkable.\"\n",
              "bob: \"reads.\" /cc @ike \n",
              "ike: hey @bob @gia \n",
              "gia: hey @ike\n"]

    tweet_factory = TweetFactory.new
    @test_tweets  = tweets.map { |tweet| tweet_factory.create(tweet)}
    @ike = User.new("ike")

    @mentions = MutualMentionsFinder.new(@test_tweets)
  end

  context 'user with two mutual mentions' do 
    it "finds the mutual mentions for user" do 
      @mentions.find_mutual_mentions_for(@ike).should == ["bob", "gia"]
    end
  end

  context 'user with no mentions' do
    let (:ava) { User.new("ava") }

    it "finds the mutual mentions for user" do 
      @mentions.find_mutual_mentions_for(ava).should == [ ]
    end
  end
end