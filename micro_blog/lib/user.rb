class User
  attr_accessor :mutual_mentions, :name

  def initialize(name, MutualMentions.new(name, tweets))
    @name = name
    @mutual_mentions = []
  end
end