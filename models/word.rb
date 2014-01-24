class Word
 attr_accessor :kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category

 def initialize attributes = {}
   # Long Way: @category = attributes[:category]
   # Short Way:
  attributes.each_pair do |attribute, value|
   self.send("#{attribute}=", value)
  end
 end

 def self.all
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select * from words order by english ASC")
  results.map do |row_hash|
   Word.new(kanji: row_hash["kanji"], onyomi: row_hash["onyomi"], kunyomi: row_hash["kunyomi"], english: row_hash["english"], jlptlevel: row_hash["jlptlevel"], category: row_hash["category"])
  end
 end

 def to_s
  "kanji: #{kanji}, onyomi: #{onyomi}, kunyomi: #{kunyomi}, english: #{english}, JLPT level: #{jlptlevel}, category: #{category}"
 end

end