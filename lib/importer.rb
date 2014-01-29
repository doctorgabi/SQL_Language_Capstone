require 'csv'

class Importer
 def self.import(from_filename)
  CSV.foreach(from_filename, headers: true) do |row_hash|
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
end