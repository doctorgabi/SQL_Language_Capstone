class Word
 attr_accessor :kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category

 def initialize attributes = {}
   # Long Way: @category = attributes[:category]
   # @kanji = attributes[:kanji]
   # @onyomi = attributes[:onyomi]
   # @kunyomi = attributes[:kunyomi]
   # @english = attributes[:english]
   # @jlptlevel = attributes[:jlptlevel]
   # @category = attributes[:category]
   # Short Way:
   [:kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category].each do |attr|
    self.send("#{attr}=", attributes[attr])
  end
 end

 def save
  database = Environment.database_connection
  database.execute("insert into words(kanji, onyomi, kunyomi, english, jlptlevel, category) values('#{kanji}', '#{onyomi}', '#{kunyomi}', '#{english}', '#{jlptlevel}', '#{category}')")
  # ^ fails silently!!
  # ^ Also, susceptible to SQL injection!
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