require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_01_to_s_prints_details
  category = Category.find_or_create("selfstudy")
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  expected = "kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category_id: selfstudy, id: #{word.id}"
  assert_equal expected, word.to_s
 end

 def test_02_update_doesnt_insert_new_row
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.update(english: "sometimes")
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before, occasionallys_after
 end

 def test_03_update_saves_to_the_database
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  id = word.id
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category_id: category2.id)
  updated_word = Word.find(id)
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [updated_word.kunyomi, updated_word.english, updated_word.jlptlevel, word.category]
  assert_equal expected, actual
 end

 def test_04_update_is_reflected_in_existing_instance
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word.update(kunyomi: "だいたい", english: "roughly", jlptlevel: "N4", category_id: category2.id)
  expected = ["だいたい", "roughly", "N4", "vocabulary"]
  actual = [word.kunyomi, word.english, word.jlptlevel, category.name]
  assert_equal expected, actual
 end

 def test_05_saved_words_are_saved
  category = Category.find_or_create("selfstudy")
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  occasionallys_before = database.execute("select count(id) from words")[0][0]
  word.save
  occasionallys_after = database.execute("select count(id) from words")[0][0]
  assert_equal occasionallys_before + 1, occasionallys_after
 end

 def test_06_save_creates_an_id
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  refute_nil word.id, "Word id shouldn't be nil"
 end

 def test_07_save_saves_category_id
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  category_id = database.execute("select category_id from words where id='#{word.id}'")[0][0]
  assert_equal category.id, category_id, "Category.id and word.category_id should be the same"
 end

 def test_08_save_update_category_id
  category1 = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("manga")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category1)
  word.category = category2
  word.save
  category_id = database.execute("select category_id from words where id='#{word.id}'")[0][0]
  assert_equal category2.id, category_id, "Category2.id and purchase.category_id should be the same"
 end

 def test_09_find_returns_nil_if_unfindable
  assert_nil Word.find(2938402984)
 end

 def test_10_find_returns_the_row_as_word_object
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  found = Word.find(word.id)
  # Ideally: assert_equal word, found
  # Hacky way so that we can focus on today's material:
  assert_equal word.english, found.english
  assert_equal word.id, found.id
 end

 def test_11_search_returns_word_objects
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category_id: category2.id)
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category_id: category2.id)
  results = Word.search("と")
  assert results.all?{ |result| result.is_a? Word }, "Not all results were Words"
 end

 def test_12_search_returns_appropriate_results
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category_id: category2.id)
  Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category_id: category2.id)
  results = Word.search("と")
  assert_equal ["とくべつ", "ときどき"], results.map(&:kunyomi)
 end

 def test_13_search_returns_appropriate_results
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  word1 = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word2 = Word.create(kunyomi:"とくべつ", english: "special", jlptlevel: "N5", category_id: category2.id)
  word3 = Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category_id: category2.id)
  expected = [word1, word2]
  actual = Word.search("と")
  assert_equal expected, actual
 end

 def test_14_all_returns_all_words
  category = Category.find_or_create("selfstudy")
  category2 = Category.find_or_create("vocabulary")
  Word.create(kunyomi:'ときどき', english: 'occasionally', jlptlevel: '0', category_id: category.id)
  Word.create(kunyomi:'とくべつ', english: 'special', jlptlevel: 'N5', category_id: category2.id)
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
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  assert word == word
 end

 def test_17_equality_with_different_class
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  refute word == "Word"
 end

 def test_18_equality_with_same_word_different_object_id
  category = Category.find_or_create("selfstudy")
  word1 = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word2 = Word.find(word1.id)
  assert word1 == word2
 end

end