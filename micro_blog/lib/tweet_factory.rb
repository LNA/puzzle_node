class TweetFactory

  def create(tweet)    
    sender = tweet[/^[^:]*/]
    determine_receivers(tweet)
    Tweet.new(sender, @receivers)
  end

  private

  def determine_receivers(tweet)
    @receivers = []
    @mid_receivers = tweet.scan(/(@+[a-zA-Z]+)/).flatten
    
    @mid_receivers.each do |mid_receiver|
      @receivers << mid_receiver[/([a-zA-Z]+)/]
    end
    @receivers
  end
end