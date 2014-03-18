class User
  attr_accessor :name, :names_of_users_tweeted_to,
                :tweets_received, :tweets_sent, :senders
  def initialize(name, mutual_mentions)
    @name = name
    @mutual_mentions = mutual_mentions
  end

end