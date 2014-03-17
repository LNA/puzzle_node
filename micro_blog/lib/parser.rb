class Parser
  def initialize(file)
    @file = file
  end

  def parse_tweets
    parse_file
    parsed_tweets = @parsed_file.split("\n")
  end

  def parse_names
    parse_file_down_to_individual_words
    @names = []

    @file_broken_down_by_searchable_words.each do |word|
      if word.match(/(@[a-zA-Z]+)/)
        @names << word.slice(/(@[a-zA-Z]+)/)
      end
    end
    @names = @names.uniq.sort_by {|name| name.downcase }
  end

  private

  def parse_file
    file = File.readlines(@file)
    @parsed_file = file*","
  end

  def parse_file_down_to_individual_words
    parse_file
    @file_broken_down_by_searchable_words = @parsed_file.split(' ')
  end
end