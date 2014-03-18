class ConnectionFactory
  def initialize(mutual_mentions)
    @mutual_mentions = mutual_mentions
    @second_level_connections = {}
  end

  def second_level_connections(first_user, second_user)
    second_level_connections = []

    @mutual_mentions[second_user].each do |value|
      if @mutual_mentions[first_user].include?(value) && @mutual_mentions[second_user].include?(value)
        @second_level_connections[first_user] = [second_user]
        @second_level_connections[second_user] = [first_user]
      end
    end
    @second_level_connections
    require 'pry'
    binding.pry
  end
end