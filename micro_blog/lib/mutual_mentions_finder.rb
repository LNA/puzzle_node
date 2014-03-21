class MutualMentionsFinder 
  attr_accessor  :tweets, :tweets_received
                
  def initialize(tweets)
    @tweets = tweets 
  end

  def find_mutual_mentions_for(user)
    sent(user.name)
    received(user.name)
    users_tweeted_to
    received_tweets_from
    mutual_mentions
  end

private 
  def sent(name)
    @tweets_sent = @tweets.select {|tweet| tweet.sender == name }
  end

  def received(name)
    @tweets_received = []
    @tweets.each do |tweet|
      if tweet.receiver.include?(name)
        @tweets_received << tweet 
      end
    end
    @tweets_received 
  end

  def users_tweeted_to
    @tweeted_to = @tweets_sent.first.receiver
    @tweeted_to.uniq
  end 

  def received_tweets_from
    @received_teweets_from = @tweets_received.map {|tweet| tweet.sender }
    @received_teweets_from.uniq
  end

  def mutual_mentions
    @mutual_mentions = []
    @mutual_mentions << @tweeted_to << @received_teweets_from 
    @mutual_mentions = @mutual_mentions.flatten
    @mutual_mentions = @mutual_mentions.select{ |element| @mutual_mentions.count(element) > 1 }
    @mutual_mentions = @mutual_mentions.uniq
  end
end