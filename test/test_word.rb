require_relative 'helper'
require_relative '../models/word'

class TestWord < JstudyTest

 def test_to_s_prints_details
  word = Word.new(kunyomi: "ときどき", english: "occasionally", jlptlevel: "0", category: "selfstudy")
  expected = "ときどき: occasionally, jlptlevel 0, selfstudy"
  assert_equal expected, word.to_s
 end

end