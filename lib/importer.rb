require 'csv'

class Importer
 def self.import(from_filename)
  # categories_to_create = []
  CSV.foreach(from_filename, headers: true) do |row_hash|
   import_word(row_hash)
  #  categories_to_create << row_hash["category"]
  # end

  # categories_to_create.uniq.each do |name|
  #  Category.create(name: name)
   Category.create(row_hash["category"])
  end
 end

 def self.import_word(row_hash)
  word = Word.create(
   kanji: row_hash["kanji"],
   onyomi: row_hash["onyomi"],
   kunyomi: row_hash["kunyomi"],
   english: row_hash["english"],
   jlptlevel: row_hash["jlptlevel"],
   category: row_hash["category"]
  )
 end
end