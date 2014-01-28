require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_to_s_prints_details
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  expected = "kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy, id: #{word.id}"
  assert_equal expected, word.to_s
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