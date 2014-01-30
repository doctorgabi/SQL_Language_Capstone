class Word
 attr_accessor :kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category
 attr_reader :id

 def initialize attributes = {}
  update_attributes(attributes)
 end

 def self.create(attributes = {})
  word = Word.new(attributes)
  word.save
  word
 end

 def update attributes = {}
  update_attributes(attributes)
  save
 end

 def save
  database = Environment.database_connection
  category_id = category.nil? ? "NULL" : category.id
  if id
   database.execute("update words set kanji = '#{kanji}', onyomi = '#{onyomi}', kunyomi = '#{kunyomi}', english = '#{english}', jlptlevel = '#{jlptlevel}', category_id = '#{category_id}' where id = #{id}")
  else
   database.execute("insert into words(kanji, onyomi, kunyomi, english, jlptlevel, category_id) values('#{kanji}', '#{onyomi}', '#{kunyomi}', '#{english}', '#{jlptlevel}', '#{category_id}')")
   @id = database.last_insert_row_id
  end
 end

 def self.find id
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select * from words where id = #{id}")[0]
  if results
   word = Word.new(kanji: results["kanji"], onyomi: results["onyomi"], kunyomi: results["kunyomi"], english: results["english"], jlptlevel: results["jlptlevel"], category: results[:jlptlevel])
   word.send("id=", results["id"])
   word
  else
   nil
  end
 end

 def self.search(search_term = nil)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select words.* from words where kunyomi LIKE '%#{search_term}%' order by english ASC")
  results.map do |row_hash|
   word = Word.new(
    kanji: row_hash[:"kanji"],
    onyomi: row_hash[:"onyomi"],
    kunyomi: row_hash[:"kunyomi"],
    english: row_hash[:"english"],
    jlptlevel: row_hash[:"jlptlevel"])
   category = Category.all.find{|category| category.id == row_hash["category_id"]}
   word.category = category
   word.send("id=", row_hash["id"])
   word
  end
 end

 def self.all
  search
 end

 def to_s
  "kanji: #{kanji}, onyomi: #{onyomi}, kunyomi: #{kunyomi}, english: #{english}, JLPT level: #{jlptlevel}, category: #{category}, id: #{id}"
 end

 def ==(other)
  if other.is_a? Word
   self.to_s == other.to_s
  else
   false
  end
 end

 protected

 def id=(id)
  @id = id
 end

 def update_attributes(attributes)
  [:kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category].each do |attr|
   if attributes[attr]
    self.send("#{attr}=", attributes[attr])
   end
  end
 end
end