class ConnectionFactory
  def initialize(user, mutual_mentions, user_2_mutual_mentions, user_3_mutual_mentions)
    @user = user
    @mutual_mentions = mutual_mentions
    @user_2_mutual_mentions = user_2_mutual_mentions

  end

  def connections
    user_connections = {}
    user_connections[@user] = { :mutual_mentions => @mutual_mentions }
    user_connections 
  end

  def add_connection_level(user_connections)
    @user_2_mutual_mentions.each do |friend|
      if @user_2_mutual_mentions.include?(friend) && friend != @user_connections
        user_connections[@user][:second_level_connections] = [friend] 
      end
    end
    user_connections
  end
end