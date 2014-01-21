require_relative 'helper'

class TestEnteringWords <MiniTest::Unit::TestCase

 def test0_error_message_for_missing_information
  command = "./jstudy add"
  expected = "You must provide the kunyomi and english and jlpt level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test01_error_message_for_missing_kunyomi
  command = "./jstudy add --english occasionally --jlptlevel 0 --category selfstudy"
  expected = "You must provide the kunyomi of the word you are adding."
  assert_command_output expected, command
 end

 def test02_error_message_for_missing_english
  command = "./jstudy add --kunyomi ときどき --jlptlevel 0 --category selfstudy"
  expected = "You must provide the english of the word you are adding."
  assert_command_output expected, command
 end

 def test03_error_message_for_missing_JLPTlevel
  command = "./jstudy add --kunyomi ときどき --english occasionally --category selfstudy"
  expected = "You must provide the jlpt level of the word you are adding."
  assert_command_output expected, command
 end

 def test04_error_message_for_missing_category
  command = "./jstudy add --kunyomi ときどき --english occasionally --jlptlevel 0"
  expected = "You must provide the category of the word you are adding."
  assert_command_output expected, command
 end

 def test05_error_message_for_missing_kunyomi_and_category
  command = "./jstudy add --english occasionally --jlptlevel 0"
  expected = "You must provide the kunyomi and category of the word you are adding."
  assert_command_output expected, command
 end

 def test06_error_message_for_missing_english_and_jlptlevel
  command = "./jstudy add --kunyomi ときどき --category selfstudy"
  expected = "You must provide the english and jlpt level of the word you are adding."
  assert_command_output expected, command
 end

 def test07_error_message_for_missing_english_and_jlptlevel_and_category
  command = "./jstudy add --kunyomi ときどき"
  expected = "You must provide the english and jlpt level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test05_that_correct_info_is_accepted
  command = "./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy"
  expected = "Theoretically creating: a word with the kunyomi ときどき, the english translation 'occasionally', JLPT level 0 and category 'selfstudy'"
  assert_command_output expected, command
 end

end