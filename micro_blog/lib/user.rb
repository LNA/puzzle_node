class User
  attr_accessor :mutual_mentions, :name

  def initialize(name, mutual_mentions)
    @name = name
    @mutual_mentions = mutual_mentions
  end
end