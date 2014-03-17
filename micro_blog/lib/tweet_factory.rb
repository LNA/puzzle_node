class TweetFactory
  attr_accessor :tweet, :tweets

  def initialize(parsed_tweets)
    @parsed_tweets = parsed_tweets
  end

  def create_tweets
    @tweets = [] 

    @parsed_tweets.each do |tweet|

      sender = tweet[/^[^:]*/]
      receiver = tweet[/(@[a-zA-Z]+)/]

      tweet = Tweet.new
      tweet.sender = sender
      tweet.receiver = receiver

      @tweets << tweet 
    end
    @tweets
  end
end