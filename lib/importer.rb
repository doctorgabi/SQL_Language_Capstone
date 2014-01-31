require 'csv'
require 'pry'
class Importer
 def self.import(from_filename)
  CSV.foreach(from_filename, headers: true) do |row_hash|
   import_word(row_hash)
  end
 end

 def self.import_word(row_hash)
  word = Word.create(kanji: row_hash["kanji"], onyomi: row_hash["onyomi"], kunyomi: row_hash["kunyomi"], english: row_hash["english"], jlptlevel: row_hash["jlptlevel"], category: row_hash["category"])
 end

 def self.skills_import(from_filename)
  CSV.foreach(from_filename, headers: true) do |row_hash|
   import_skill(row_hash)
  end
 end

 def self.import_skill(row_hash)
  skill = Skill.create(english_to_pronunciation: row_hash["english_to_pronunciation"], pronunciation_to_english: row_hash["pronunciation_to_english"], kanji_to_english: row_hash["kanji_to_english"], english_to_kanji: row_hash["english_to_kanji"], kanji_to_pronunciation: row_hash["kanji_to_pronunciation"], pronunciation_to_kanji: row_hash["pronunciation_to_kanji"], k_e_reps: row_hash["k_e_reps"], e_k_reps: row_hash["e_k_reps"], k_p_reps: row_hash["k_p_reps"], p_k_reps: row_hash["p_k_reps"], e_p_reps: row_hash["e_p_reps"], p_e_reps: row_hash["p_e_reps"])
 end

end