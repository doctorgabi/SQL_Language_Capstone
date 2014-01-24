require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_to_s_prints_details
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  expected = "kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy"
  assert_equal expected, word.to_s
 end

 def test_all_returns_all_words
  database.execute("insert into words(kunyomi, english, jlptlevel, category) values('ときどき', 'occasionally', '0', 'selfstudy')")
  database.execute("insert into words(kunyomi, english, jlptlevel, category) values('とくべつ', 'special', 'N5', 'vocabulary')")
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