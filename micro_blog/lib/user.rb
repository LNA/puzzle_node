class User
  attr_accessor :name, :received_tweets, :sent_tweets
  def initialize(name)
    @name = name
  end

  def sent(tweets)
    @sent_tweets = tweets.select {|tweet| tweet.sender == name }
  end

  def received(tweets)
    @received_tweets = tweets.select {|tweet| tweet.receiver == name}
  end

  def tweets_involving_user
    tweets_involving_user = []
    tweets_involving_user << @sent_tweets
    tweets_involving_user << @received_tweets
    tweets_involving_user.flatten
  end
end