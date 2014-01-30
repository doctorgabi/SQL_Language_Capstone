require_relative 'helper'

class TestSearchingEnglishWords < JstudyTest
 def test_01_searchenglish_returns_relevant_results
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`

  shell_output = ""
  IO.popen('./jstudy searchenglish --environment test', 'r+') do |pipe|
   pipe.puts("al")
   pipe.close_write
   shell_output = pipe.read
  end
  assert_in_output shell_output, "occasionally", "special"
  assert_not_in_output shell_output, "nothing"
 end
end