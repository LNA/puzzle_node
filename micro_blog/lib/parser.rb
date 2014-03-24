class Parser
  def initialize(file)
    @file = file
  end

  def parse_file
    @parsed_file = File.readlines(@file)
  end

  def parse_names
    @names = []

    @parsed_file.each do |tweet|
      @names << tweet.split(':').first
    end
    @names = @names.uniq.sort_by {|name| name.downcase }
  end

end