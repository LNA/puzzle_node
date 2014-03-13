class TweetParser
  def initialize(file)
    @file = file
  end

  def parse_file_down_to_individual_words
    file = File.readlines(@file)
    file_broken_down_by_lines = file*","
    @file_broken_down_by_searchable_words = file_broken_down_by_lines.split(' ')
  end

  def parse_users
    @users = []

    @file_broken_down_by_searchable_words.each do |word|
      if word.match(/(@[a-zA-Z]+)/)
        @users << word.slice(/(@[a-zA-Z]+)/)
      end
    end
    @users.uniq.sort_by {|word| word.downcase }
  end
end