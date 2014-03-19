class MutualMentions
  attr_accessor :name, :names_of_users_tweeted_to, :tweets,
                :tweets_received, :tweets_sent, :sender
  def initialize(name, tweets)
    @name = name
    @tweets = tweets 
    @mutual_mentions = []
  end

  def find_mutual_mentions
    sent
    received
    users_tweeted_to
    received_tweets_from
    mutual_mentions
  end

  def sent
    @tweets_sent = @tweets.select {|tweet| tweet.sender == name }
  end

  def received
    @tweets_received = @tweets.select {|tweet| tweet.receiver == name}
  end

  def users_tweeted_to
    @tweeted_to = @tweets_sent.map {|tweet| tweet.receiver }
    @tweeted_to.uniq
  end 

  def received_tweets_from
    @received_teweets_from = @tweets_received.map {|tweet| tweet.sender }
    @received_teweets_from.uniq
  end

  def mutual_mentions
    @mutual_mentions << @tweeted_to << @received_teweets_from 
    @mutual_mentions = @mutual_mentions.flatten
    @mutual_mentions = @mutual_mentions.select{ |element| @mutual_mentions.count(element) > 1 }
    @mutual_mentions = @mutual_mentions.uniq
  end
end