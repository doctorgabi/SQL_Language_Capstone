require_relative 'helper'

 class TestImportingWords < JstudyTest
  def import_data
   Importer.import("test/sample_word_data.csv")
  end

  def test_the_correct_number_of_words_are_imported
   import_data
   assert 4, Word.all.count
  end

  def test_words_are_imported_fully
   import_data
   expected = ["日, ニチ ジツ -, ひ -び, day sun Japan, N5, Kanji",
   "一, イチ イツ ヒト., ひと-, one, N5, Kanji",
   "遊び, , あそび, play, N4, Vocabulary",
   "集る, , あつまる, to gather, N4, Vocabulary"]
   actual = Word.all.map do |word|
    "#{word.kanji}, #{word.onyomi}, #{word.kunyomi}, #{word.english}, #{word.jlptlevel}, #{word.category}"
   end
   assert_equal expected, actual
  end

  def test_extra_categories_arent_created
   import_data
   assert 2, Category.all.count
  end

  def test_categories_are_created_as_needed
   Category.create("Vocabulary")
   Category.create("Selfstudy")
   import_data
   assert 3, Category.all.count
  end

  def test_data_isnt_duplicated
   import_data
   expected = ["Kanji", "Vocabulary"]
   assert_equal expected, Category.all.map(&:english)
  end
 end