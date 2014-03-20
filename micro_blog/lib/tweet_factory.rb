class TweetFactory
  attr_accessor :tweet, :tweets, :parsed_tweets, :sender,
                :receiver, :parsed_tweet

  def initialize(parsed_tweets)
    @parsed_tweets = parsed_tweets
  end

  def create_tweets
    @tweets = [] 

    @parsed_tweets.each do |parsed_tweet|
    
      sender = parsed_tweet[/^[^:]*/]
      receivers = []
    
      mid_receivers = parsed_tweet.scan(/(@+[a-zA-Z]+)/).flatten
      
      mid_receivers.each do |mid_receiver|
        receivers << mid_receiver[/([a-zA-Z]+)/]
      end
  
      tweet = Tweet.new(sender, receivers)

      @tweets << tweet 
    end
    @tweets
  end
end