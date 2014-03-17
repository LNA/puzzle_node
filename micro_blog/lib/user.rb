class User
  attr_accessor :name, :received_tweets, :sent_tweets
  def initialize(name)
    @name = name
    @sent_tweets = []
    @received_tweets = []
  end

  def sent(tweets)
    tweets.each do |tweet|
      if tweet.sender == name
        @sent_tweets << tweet
      end
    end
    @sent_tweets
  end

  def received(tweets)
  end

  def first_level_connection
  end
end