require 'csv'

class Importer
 def self.import(from_filename)
  CSV.foreach(from_filename, headers: true) do |row_hash|
   import_word(row_hash)
  end
 end

 def self.import_word(row_hash)
  category = Category.find_or_create(row_hash["category"])
  word = Word.create(
   kanji: row_hash["kanji"],
   onyomi: row_hash["onyomi"],
   kunyomi: row_hash["kunyomi"],
   english: row_hash["english"],
   jlptlevel: row_hash["jlptlevel"],
   category: row_hash["category"],
   category: category
  )
 end
end