class User
  attr_accessor :name, :tweets
  def initialize(name, tweets = {})
    @name = name
    @tweets = tweets
  end
end