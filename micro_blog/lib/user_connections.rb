class UserConnections 
  attr_accessor :users, :user_connections

  def initialize(users, tweets)
    @users = users
    @mutual_mentions = MutualMentionsFinder.new(tweets)
  end

  def connections
    @user_connections = {}

    @users.each do |user|
      if @mutual_mentions.find_mutual_mentions_for(user) != []
        @user_connections[user.name] = { "level 1" => @mutual_mentions.find_mutual_mentions_for(user) }
      else
        @user_connections[user.name] = { "level 1" => [] }
      end
    end
    @user_connections 
  end

  def add_connection_level
    @user_connections.each_pair do |user, connection|
      @users.each do |friend|
        if connection["level 1"].include?(friend.name) == false && user != friend.name
          check_for_another_level(user, connection, friend)
        end
      end
    end
    @user_connections
  end

  def check_for_another_level(user, connection, friend)
    count = 1
    if (@mutual_mentions.find_mutual_mentions_for(friend)  & connection["level #{count}"]) != [] 
      count += 1
      connection["level #{count}"] = [friend.name]
    else
      count += 2
      connection["level #{count}"] = [friend.name]
    end
  end
end