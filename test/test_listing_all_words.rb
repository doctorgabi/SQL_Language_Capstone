require_relative 'helper'

class TestListingWords < JstudyTest
 def test_list_returns_relevant_results
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`

  command = "./jstudy list"
  expected = <<EOS.chomp
All Words:
kanji: , onyomi: , kunyomi: なにも, english: nothing, JLPT level: N4, category: vocabulary
kanji: , onyomi: , kunyomi: ときどき, english: occasionally, JLPT level: 0, category: selfstudy
kanji: , onyomi: , kunyomi: とくべつ, english: special, JLPT level: N5, category: vocabulary
EOS
  assert_command_output expected, command
 end
end