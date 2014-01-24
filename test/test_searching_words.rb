require_relative 'helper'

class TestSearchingWords < JstudyTest
 def test_search_returns_relevant_results
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`

  shell_output = ""
  IO.popen('./jstudy search --environment test', 'r+') do |pipe|
   pipe.puts("と")
   pipe.close_write
   shell_output = pipe.read
  end
  assert_in_output shell_output, "とくべつ", "ときどき"
  assert_not_in_output shell_output, "なにも"
 end
end