require_relative '../lib/environment'

class Word
 attr_accessor :kanji, :onyomi, :kunyomi, :english, :jlptlevel, :category
 attr_reader :id

 def initialize attributes = {}
  update_attributes(attributes)
 end

 def self.count
  database = Environment.database_connection
  database.execute("select count(id) from words")[0][0]
 end

 def self.create(attributes = {})
  word = Word.new(attributes)
  word.save
  # database.execute("insert into skills(english_to_pronunciation, pronunciation_to_english, kanji_to_english, english_to_kanji, kanji_to_pronunciation, pronunciation_to_kanji, k_e_reps, e_k_reps, k_p_reps, p_k_reps, e_p_reps, p_e_reps) values('-1', '-1', '-1', '-1', '-1', '-1', '0', '0', '0', '0', '0', '0')")
  Skill.new()
  word
 end

 def update attributes = {}
  update_attributes(attributes)
  save
 end

 def save
  database = Environment.database_connection
  if id
   database.execute("update words set kanji = '#{kanji}', onyomi = '#{onyomi}', kunyomi = '#{kunyomi}', english = '#{english}', jlptlevel = '#{jlptlevel}', category = '#{category}' where id = #{id}")
  else
   database.execute("insert into words(kanji, onyomi, kunyomi, english, jlptlevel, category) values('#{kanji}', '#{onyomi}', '#{kunyomi}', '#{english}', '#{jlptlevel}', '#{category}')")
   @id = database.last_insert_row_id
  end
 end

 def self.find id
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select * from words where id = #{id}")[0]
  if results
   word = Word.new(kanji: results["kanji"], onyomi: results["onyomi"], kunyomi: results["kunyomi"], english: results["english"], jlptlevel: results["jlptlevel"], category: results["category"])
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
   word = Word.new(kanji: row_hash["kanji"], onyomi: row_hash["onyomi"], kunyomi: row_hash["kunyomi"], english: row_hash["english"], jlptlevel: row_hash["jlptlevel"], category: row_hash["category"])
   word.send("id=", row_hash["id"])
   word
  end
 end

 def self.searchenglish(search_term = nil)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select words.* from words where english LIKE '%#{search_term}%' order by english ASC")
  results.map do |row_hash|
   word = Word.new(kanji: row_hash["kanji"], onyomi: row_hash["onyomi"], kunyomi: row_hash["kunyomi"], english: row_hash["english"], jlptlevel: row_hash["jlptlevel"], category: row_hash["category"])
   word.send("id=", row_hash["id"])
   word
  end
 end

 def self.search_to_delete(searchterm, word)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select words.* from words where #{searchterm} LIKE '%#{word}%' order by english ASC")
  results
 end

 def self.delete_by_id(id)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("delete from words where id = #{id}")
 end

 def self.searchjlpt(search_term = nil)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select words.* from words where jlptlevel LIKE '%#{search_term}%' order by english ASC")
  results.map do |row_hash|
   word = Word.new(kanji: row_hash["kanji"], onyomi: row_hash["onyomi"], kunyomi: row_hash["kunyomi"], english: row_hash["english"], jlptlevel: row_hash["jlptlevel"], category: row_hash["category"])
   word.send("id=", row_hash["id"])
   word
  end
 end

 def self.status(level, ability)
  database = Environment.database_connection
  database.results_as_hash = true
  results = database.execute("select kanji, onyomi, kunyomi, english from words inner join skills on words.id = skills.id where(english_to_pronunciation = #{ability} or pronunciation_to_english = #{ability} or kanji_to_english = #{ability} or english_to_kanji = #{ability} or pronunciation_to_kanji = #{ability} or kanji_to_pronunciation = #{ability}) and jlptlevel = '#{level}'")
  results
 end

 def self.listlevel(level)
  searchjlpt(level)
 end

 def self.all
  search
 end

 def to_s
  "kanji: #{kanji}, onyomi: #{onyomi}, kunyomi: #{kunyomi}, english: #{english}, JLPT level: #{jlptlevel}, category: #{category}, id: #{id}"
 end

 def ==(other)
  other.is_a?(Word) && self.to_s == other.to_s
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