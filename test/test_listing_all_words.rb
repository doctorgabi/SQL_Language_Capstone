require_relative 'helper'

class TestListingWords < JstudyTest
 def test_list_returns_relevant_results
  # create will be new+save
  selfstudy = Category.find_or_create("selfstudy")
  vocab = Category.find_or_create("vocabulary")
  occasionally = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: selfstudy.id)
  special = Word.create(kunyomi: "とくべつ", english: "special", jlptlevel: "N5", category_id: vocab.id)
  nothing = Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category_id: vocab.id)

  command = "./jstudy list"
  expected = <<EOS.chomp
All Words:
kanji: , onyomi: , kunyomi: なにも, english: nothing, JLPT level: N4, category: vocabulary, id: #{nothing.id}
kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy, id: #{occasionally.id}
kanji: , onyomi: , kunyomi: とくべつ, english: special, JLPT level: N5, category: vocabulary, id: #{special.id}
EOS
  assert_command_output expected, command
 end
end