require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_01_to_s_prints_details
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  expected = "kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy, id: #{word.id}"
  assert_equal expected, word.to_s
 end

 def test_02_update_doesnt_insert_new_row
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.update(english: "sometimes")
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before, occasionallys_after
 end

 def test_03_update_saves_to_the_database
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  id = word.id
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category_id: category2.id)
  updated_word = Word.find(id)
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [updated_word.kunyomi, updated_word.english, updated_word.jlptlevel, word.category]
  assert_equal expected, actual
 end

 def test_04_update_is_reflected_in_existing_instance
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category: "vocabulary")
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [word.kunyomi, word.english, word.jlptlevel, category.name]
  assert_equal expected, actual
 end

 def test_05_saved_words_are_saved
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.save
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before + 1, occasionallys_after
 end

 def test_06_save_creates_an_id
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  refute_nil word.id, "Word id shouldn't be nil"
 end

 def test_09_find_returns_nil_if_unfindable
  assert_nil Word.find(2938402984)
 end

 def test_10_find_returns_the_row_as_word_object
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  found = Word.find(word.id)
  assert_equal word.english, found.english
  assert_equal word.id, found.id
 end

 def test_11_search_returns_word_objects
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  results = Word.search("と")
  assert results.all?{ |result| result.is_a? Word }, "Not all results were Words"
 end

 def test_12_search_returns_appropriate_results
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  results = Word.search("と")
  assert_equal ["ときどき", "とくべつ"], results.map(&:kunyomi)
 end

 def test_13_search_returns_appropriate_results
  word1 = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  word2 = Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  word3 = Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  expected = [word1, word2]
  actual = Word.search("と")
  assert_equal expected, actual
 end

 def test_14_all_returns_all_words
  Word.create(kunyomi:'ときどき', english: 'occasionally', jlptlevel: '0', category: "selfstudy")
  Word.create(kunyomi:'とくべつ', english: 'special', jlptlevel: 'N5', category: "vocabulary")
  results = Word.all
  expected = ["occasionally", "special"]
  actual = results.map{ |word| word.english }
   # ^ is equivalent to:
   # actual = []
   # results.each do |word|
   #   actual << word.english
   # end
  assert_equal expected, actual
 end

 def test_15_all_returns_empty_array_if_no_words
  results = Word.all
  assert_equal [], results
 end

 def test_16_equality_on_same_object
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  assert word == word
 end

 def test_17_equality_with_different_class
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  refute word == "Word"
 end

 def test_18_equality_with_same_word_different_object_id
  word1 = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  word2 = Word.find(word1.id)
  assert word1 == word2
 end

end