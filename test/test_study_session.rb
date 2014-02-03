require_relative 'helper'

class TestStudySession < JstudyTest

 def test_01_start_a_kanji_practice_session
  `./jstudy add --kanji 何 --kunyomi なに --english what --JLPTlevel N5 --category kanji --environment test`
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`
  shell_output = ""
  IO.popen('./jstudy start --environment test', 'r+') do |pipe|
   pipe.puts("k")
   # pipe.puts("5")
   pipe.close_write
   shell_output = pipe.read
  end
  assert_in_output shell_output, "Let's start a kanji practice session, はじめましょう！"
 end

 # def test_02_check_the_answer_is_shown_during_the_kanji_study_session
 #  `./jstudy add --kanji 何 --kunyomi なに --english what --JLPTlevel N5 --category kanji --environment test`
 #  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
 #  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`
 #  shell_output = ""
 #  IO.popen('./jstudy start --environment test', 'r+') do |pipe|
 #   pipe.puts("k")
 #   pipe.puts("5")
 #   pipe.puts("n")
 #   pipe.close_write
 #   shell_output = pipe.read
 #  end
 #  assert_in_output shell_output, "I have no way of knowing which of the kanji, kunyomi or english will be shown at random and which of the kanji, kunyomi or english will be randomly quizzed as the answer..."
 # end

 def test_03_start_a_vocab_practice_session
  `./jstudy add --kunyomi ときどき --english occasionally --JLPTlevel 0 --category selfstudy --environment test`
  `./jstudy add --kunyomi とくべつ --english special --JLPTlevel N5 --category vocabulary --environment test`
  `./jstudy add --kunyomi なにも --english nothing --JLPTlevel N4 --category vocabulary --environment test`
  shell_output = ""
  IO.popen('./jstudy start --environment test', 'r+') do |pipe|
   pipe.puts("v")
   # pipe.puts("4")
   pipe.close_write
   shell_output = pipe.read
  end
  assert_in_output shell_output, "Let's start a vocabulary practice session, はじめましょう！"
 end

end