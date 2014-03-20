class TweetFactory

  def create(tweet)    
    sender = tweet[/^[^:]*/]
    receivers = []
  
    mid_receivers = tweet.scan(/(@+[a-zA-Z]+)/).flatten
    
    mid_receivers.each do |mid_receiver|
      receivers << mid_receiver[/([a-zA-Z]+)/]
    end

    Tweet.new(sender, receivers)
  end
end