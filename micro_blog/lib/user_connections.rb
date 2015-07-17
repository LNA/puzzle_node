class UserConnections 
  attr_accessor :users, :user_connections

  def initialize(users, mutual_mentions)
    @users = users
    @mutual_mentions = mutual_mentions
  end

  def first_level_connections
    @user_connections = {}

    @users.each do |user|
      if @mutual_mentions.find_mutual_mentions_for(user) != []
        @user_connections[user.name] = { "level 1" => @mutual_mentions.find_mutual_mentions_for(user) }
      end
    end
    @user_connections 
  end

  def find_connection_level
    @user_connections.each_pair do |user, connection|
      check(user, connection)
    end
    @user_connections
  end

  private

  def check_for_another_level(user, connection, friend)
    count = 1
    if (@mutual_mentions.find_mutual_mentions_for(friend) & connection["level #{count}"]) != [] 
      count += 1
      connection["level #{count}"] = [friend.name]
    else
      count += 2
      connection["level #{count}"] = [friend.name]
    end
  end

  def check(user, connection)
    @users.each do |friend|
      if connection["level 1"].include?(friend.name) == false && user != friend.name
        check_for_another_level(user, connection, friend)
      end
    end
  end
end