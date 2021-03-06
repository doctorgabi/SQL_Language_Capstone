require_relative 'helper'

class TestEditingWords < JstudyTest
 def test_01_updating_a_record_that_exists
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  id = word.id
  command = "./jstudy edit --id #{id} --kunyomi 'ときどき' --english 'sometimes!' --jlptlevel 'N4' --category 'vocabulary'"
  expected = "Word #{id} now has the kanji , the onyomi , the kunyomi ときどき, the english translation 'sometimes!', the JLPT level N4 and the category vocabulary."
  assert_command_output expected, command
 end

 def test_02_attempting_to_update_a_non_existant_record
  command = "./jstudy edit --id 2934892837498234 --kunyomi ときどき --english sometimes! --jlptlevel N4 --category vocabulary"
  expected = "Word 2934892837498234 couldn't be found."
  assert_command_output expected, command
 end

 def test_03_attempting_to_update_with_no_changes
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  id = word.id
  command = "./jstudy edit --id #{id} --kunyomi ときどき --english occasionally --jlptlevel 0 --category selfstudy"
  expected = "Word #{id} now has the kanji , the onyomi , the kunyomi ときどき, the english translation 'occasionally', the JLPT level 0 and the category selfstudy."
  assert_command_output expected, command
 end

end
