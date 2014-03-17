class Parser
  def initialize(file)
    @file = file
  end

  def parse_tweets
    parse_file
  end

  def parse_names
    parse_file 
    @names = []

    @parsed_file.each do |word|
      if word.match(/([a-zA-Z]+)/)
        @names << word.slice(/([a-zA-Z]+)/)
      end
    end
    @names = @names.uniq.sort_by {|name| name.downcase }
  end

  private

  def parse_file
    @parsed_file = File.readlines(@file)
  end
end