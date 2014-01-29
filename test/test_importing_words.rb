require_relative 'helper'
require_relative '../lib/importer'

 class TestImportingWords < JstudyTest
  def import_data
   Importer.import("test/sample_word_data.csv")
  end

  def test_the_correct_number_of_words_are_imported
   import_data
   assert_equal 4, Word.all.count
  end

  def test_words_are_imported_fully
   skip
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
   skip
   import_data
   assert_equal 2, Category.all.count
  end

  def test_categories_are_created_as_needed
   skip
   Category.create(name: "Vocabulary")
   Category.create(name: "Selfstudy")
   import_data
   assert_equal 3, Category.all.count, "The categories were: #{Category.all.map(&:name)}"
  end

  def test_data_isnt_duplicated
   skip
   import_data
   expected = ["Kanji", "Vocabulary"]
   assert_equal expected, Category.all.map(&:name)
   # ^equivalent:
   # category_names = Category.all.map{ |category| category.name }
   # assert_equal expected, category_names
  end
 end