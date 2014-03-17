class User
  attr_accessor :name, :names_of_users_tweeted_to,
                :received_tweets, :sent_tweets, :senders
  def initialize(name)
    @name = name
  end

  def sent(tweets)
    @sent_tweets = tweets.select {|tweet| tweet.sender == name }
  end

  def received(tweets)
    @received_tweets = tweets.select {|tweet| tweet.receiver == name}
  end

  def users_tweeted_to
    @names_of_users_tweeted_to = @sent_tweets.map {|tweet| tweet.receiver }
    @names_of_users_tweeted_to.uniq
  end 

  def received_tweets_from
    @names_of_users_received_teweets_from = @received_tweets.map {|tweet| tweet.sender }
    @names_of_users_received_teweets_from.uniq
  end

  def interacting_with
    @names_of_users_interacting_with = []
    @names_of_users_interacting_with << @names_of_users_tweeted_to << @names_of_users_received_teweets_from 
    @names_of_users_interacting_with.flatten
  end
end