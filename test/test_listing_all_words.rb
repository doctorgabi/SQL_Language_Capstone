require_relative 'helper'

class TestListingWords < JstudyTest
 def test_01_list_returns_relevant_results
  occasionally = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  special = Word.create(kunyomi: "とくべつ", english: "special", jlptlevel: "N5", category: "vocabulary")
  nothing = Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")

  command = "./jstudy list"
  expected = <<EOS.chomp
All Words:
kanji: , onyomi: , kunyomi: なにも, english: nothing, JLPT level: N4, category: vocabulary, id: #{nothing.id}
kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy, id: #{occasionally.id}
kanji: , onyomi: , kunyomi: とくべつ, english: special, JLPT level: N5, category: vocabulary, id: #{special.id}
EOS
  assert_command_output expected, command
 end

  def test_02_list_with_JLPT_level_returns_relevant_results
  occasionally = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  special = Word.create(kunyomi: "とくべつ", english: "special", jlptlevel: "N5", category: "selfstudy")
  nothing = Word.create(kunyomi: "なにも", english: "nothing", jlptlevel: "N4", category: "vocabulary")
  always = Word.create(kunyomi: "いつも", english: "always", jlptlevel: "N5", category: "vocabulary")
  what = Word.create(kanji: "何", kunyomi: "なに", english: "what", jlptlevel: "N5", category: "kanji")

  command = "./jstudy list --jlptlevel N5"
  expected = <<EOS.chomp
All N5 Words:
kanji: , onyomi: , kunyomi: いつも, english: always, JLPT level: N5, category: vocabulary, id: #{always.id}
kanji: , onyomi: , kunyomi: とくべつ, english: special, JLPT level: N5, category: selfstudy, id: #{special.id}
kanji: 何, onyomi: , kunyomi: なに, english: what, JLPT level: N5, category: kanji, id: #{what.id}
EOS
  assert_command_output expected, command
 end


end