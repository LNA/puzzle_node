class Parser
  def initialize(file)
    @file = file
  end

  def parse_file
    @parsed_file = File.readlines(@file)
  end

  def parse_names
    @names = []
    pull_user_name_from_tweet
    @names = @names.uniq.sort_by {|name| name.downcase }
  end

private

  def pull_user_name_from_tweet
    @parsed_file.each do |tweet|
      @names << tweet.split(':').first
    end
    @names
  end

end