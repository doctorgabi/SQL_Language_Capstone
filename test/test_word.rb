require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_to_s_prints_details
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  expected = "kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy, id: #{word.id}"
  assert_equal expected, word.to_s
 end

 def test_update_doesnt_insert_new_row
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.update(english: "sometimes")
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before, occasionallys_after
 end

 def test_update_saves_to_the_database
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  id = word.id
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category: "vocabulary")
  updated_word = Word.find(id)
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [updated_word.kunyomi, updated_word.english, updated_word.jlptlevel, word.category]
  assert_equal expected, actual
 end

 def test_update_is_reflected_in_existing_instance
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category: "vocabulary")
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [word.kunyomi, word.english, word.jlptlevel, word.category]
  assert_equal expected, actual
 end

 def test_saved_words_are_saved
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.save
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before + 1, occasionallys_after
 end

 def dest_save_creates_an_id
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  refute_nil word.id, "Word id shouldn't be nil"
 end

 def test_find_returns_nil_if_unfindable
  assert_nil Word.find(2938402984)
 end

 def test_find_returns_the_row_as_word_object
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  found = Word.find(word.id)
  # Ideally: assert_equal word, found
  # Hacky way so that we can focus on today's material:
  assert_equal word.english, found.english
  assert_equal word.id, found.id
 end

 def test_search_returns_word_objects
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  results = Word.search("と")
  assert results.all?{ |result| result.is_a? Word }, "Not all results were Words"
 end

 def test_search_returns_appropriate_results
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  results = Word.search("と")
  assert_equal ["とくべつ", "ときどき"], results.map(&:kunyomi)
 end

 def test_search_returns_appropriate_results
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  results = Word.search("は")
  assert_equal [], results
 end

 def test_all_returns_all_words
  Word.create(kunyomi:'ときどき', english: 'occasionally', jlptlevel: '0', category: 'selfstudy')
  Word.create(kunyomi:'とくべつ', english: 'special', jlptlevel: 'N5', category: 'vocabulary')
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

 def test_all_returns_empty_array_if_no_words
  results = Word.all
  assert_equal [], results
 end

end