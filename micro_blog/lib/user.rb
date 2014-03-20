class User
  attr_accessor :mutual_mentions, :name

  def initialize(name, tweets)
    @name = name
    @mutual_mentions = MutualMentionsFactory.new(name, tweets)
  end
end