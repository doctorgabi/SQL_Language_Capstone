require_relative 'helper'
require 'sqlite3'

class TestEnteringWords < JstudyTest

 def test_0_error_message_for_missing_all_arguments
  command = "./jstudy add"
  expected = "You must provide the kunyomi and english and jlpt level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test_01_error_message_for_missing_one_argument_kunyomi
  command = "./jstudy add --english occasionally --jlptlevel 0 --category selfstudy"
  expected = "You must provide the kunyomi of the word you are adding."
  assert_command_output expected, command
 end

 def test_02_error_message_for_missing_one_argument_english
  command = "./jstudy add --kunyomi ときどき --jlptlevel 0 --category selfstudy"
  expected = "You must provide the english of the word you are adding."
  assert_command_output expected, command
 end

 def test_03_error_message_for_missing_one_argument_JLPTlevel
  command = "./jstudy add --kunyomi ときどき --english occasionally --category selfstudy"
  expected = "You must provide the jlpt level of the word you are adding."
  assert_command_output expected, command
 end

 def test_04_error_message_for_missing_one_argument_category
  command = "./jstudy add --kunyomi ときどき --english occasionally --jlptlevel 0"
  expected = "You must provide the category of the word you are adding."
  assert_command_output expected, command
 end

 def test_05_error_message_for_missing_two_arguments_kunyomi_and_category
  command = "./jstudy add --english occasionally --jlptlevel 0"
  expected = "You must provide the kunyomi and category of the word you are adding."
  assert_command_output expected, command
 end

 def test_06_error_message_for_missing_two_arguments_english_and_jlptlevel
  command = "./jstudy add --kunyomi ときどき --category selfstudy"
  expected = "You must provide the english and jlpt level of the word you are adding."
  assert_command_output expected, command
 end

 def test_07_error_message_for_missing_three_arguments_english_and_jlptlevel_and_category
  command = "./jstudy add --kunyomi ときどき"
  expected = "You must provide the english and jlpt level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test_08_that_all_correct_info_is_accepted
  command = "./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy"
  expected = "A word with the kunyomi ときどき, the english translation 'occasionally', JLPT level 0 and category 'selfstudy' was created."
  assert_command_output expected, command
 end

 def test_valid_word_gets_saved
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  results = database.execute("select kunyomi, english, jlptlevel, category from words")
  expected = ["ときどき", "occasionally", "0", "selfstudy"]
  assert_equal expected, results[0]

  result = database.execute("select count(id) from words")
  assert_equal 1, result[0][0]
 end

 def test_invalid_words_do_not_get_saved
  `./jstudy add --kunyomi ときどき --english occasionally`
  result = database.execute("select count(id) from words")
  assert_equal 0, result[0][0]
 end

end