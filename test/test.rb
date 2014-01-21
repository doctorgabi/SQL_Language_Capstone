require_relative 'helper'

class TestEnteringPurchases <MiniTest::Unit::TestCase

 def test01_error_message_for_missing_kunyomi
  command = "./jstudy add"
  expected = "You must provide the kunyomi of the word you want to add."
  assert_command_output expected, command
 end

 def test02_error_message_for_missing_english
  command = "./jstudy add --kunyomi ときどき"
  expected = "You must provide the english and JLPT level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test03_error_message_for_missing_JLPTlevel
  command = "./jstudy add --kunyomi ときどき --english occasionally"
  expected = "You must provide the JLPT level and category of the word you are adding."
  assert_command_output expected, command
 end

 def test04_error_message_for_missing_category
  command = "./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0"
  expected = "You must provide the category of the word you are adding."
  assert_command_output expected, command
 end

 def test05_that_correct_info_is_accepted
  skip command = "./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy"
 end

end