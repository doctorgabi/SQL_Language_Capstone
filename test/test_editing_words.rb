require_relative 'helper'

class TestEditingWords < JstudyTest
 def test_updating_a_record_that_exists
  category = Category.find_or_create("selfstudy")
  word = Word.create(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  id = word.id
  command = "./jstudy edit --id #{id} --kunyomi 'ときどき' --english 'sometimes!' --jlptlevel 'N4' --category 'vocabulary'"
  expected = "Word #{id} now has the kanji , the onyomi , the kunyomi ときどき, the english translation 'sometimes!', the JLPT level N4 and the category vocabulary."
  # What about the db?
  assert_command_output expected, command
 end

 def test_attempting_to_update_a_non_existant_record
  command = "./jstudy edit --id 2934892837498234 --kunyomi ときどき --english sometimes! --jlptlevel N4 --category vocabulary"
  expected = "Word 2934892837498234 couldn't be found."
  assert_command_output expected, command
 end

 def test_attempting_to_update_with_no_changes
  category = Category.find_or_create("selfstudy")
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word.save
  id = word.id
  command = "./jstudy edit --id #{id} --kunyomi ときどき --english occasionally --jlptlevel 0 --category selfstudy"
  expected = "Word #{id} now has the kanji , the onyomi , the kunyomi ときどき, the english translation 'occasionally', the JLPT level 0 and the category selfstudy."
  assert_command_output expected, command
 end

 def test_attempting_to_update_with_bad_data
  skip
  category = Category.find_or_create("selfstudy")
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word.save
  id = word.id #<--- First thing we have to implement
  command = "./jstudy edit --id #{id} --kunyomi ときどき --english occasionally --jlptlevel N35 --category selfstudy"
  expected = "Word #{id} can't be updated. JLPT level must be 2 digits maximum."
  assert_command_output expected, command
 end

 def test_attempting_to_update_partial_data
  skip
  category = Category.find_or_create("selfstudy")
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category_id: category.id)
  word.save
  id = word.id #<--First thing we have to implement
  command = "./jstudy edit --id #{id} -- english sometimes!"
  expected = "Word #{id} now has the kunyomi ときどき, the english sometimes!, the JLPT level 0 and the category selfstudy."
  assert_command_output expected, command
 end

end
