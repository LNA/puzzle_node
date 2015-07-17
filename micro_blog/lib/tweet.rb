class Tweet
  attr_accessor :sender, :receivers
  def initialize(sender, receivers)
    @sender = sender 
    @receivers = receivers 
  end
end