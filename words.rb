require_relative 'lib/parse_arguments'

class Words

 def create(options)
  require "sqlite3"
  database = Environment.database_connection(options[:environment])
  statement = "insert into words(kanji, onyomi, kunyomi, english, jlptlevel, category) values('#{options[:kanji]}', '#{options[:onyomi]}', '#{options[:kunyomi]}', '#{options[:english]}', '#{options[:jlptlevel]}', '#{options[:category]}')"
  database.execute(statement)
  "A word with the kunyomi #{options[:kunyomi]}, the english translation '#{options[:english]}', JLPT level #{options[:jlptlevel]} and category '#{options[:category]}' was created."
 end

 def update

 end

 def delete

 end

 def self.search

 end

 def self.all

 end

 def to_s

 end
end


# You only have one model at this point, so this is a great time to pull all of that information into one class.

# Today, try to take everything related to your first model and pull it into a class.