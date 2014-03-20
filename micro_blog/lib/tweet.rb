class Tweet
  attr_accessor :sender, :receiver
  def initialize(sender, receiver)
    @sender = sender 
    @receiver = receiver 
  end
end