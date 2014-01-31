class Study_session
 attr_accessor :lesson_type

 def initialize
  @lesson_type = lesson_type
 end

 def say_hello(lesson_type)
  "Hello World, your lesson_type is #{lesson_type}"
 end
 # attr_accessor :jlpt_level, :lesson_type
 # def initialize
 #  lesson_type = start_screen_gets_lesson_type
 # end



 # until(lesson_type == "v" || lesson_type == "k" || lesson_type == "q") do
 #  lesson_type = start_screen_gets_lesson_type
 # end

 # if lesson_type == "v"
 #  puts "let's start a vocabulary practice session, はじめましょう！"
 #  jlpt_level = get_jlpt_level
 #  start_practicing(lesson_type, jlpt_level)
 # elsif lesson_type == "k"
 #  puts "let's start a kanji practice session, はじめましょう！"
 #  jlpt_level = get_jlpt_level
 #  start_practicing(lesson_type, jlpt_level)
 # else lesson_type == "q"
 #  puts "See you next time, じゃまたね"
 #  exit
 # end

 # def start_screen_gets_lesson_type
 #  puts "
 #     ______________________________________________________________
 #    | ___________________________________________________________  |
 #    | |   _______     ______   _______ __   __  ______  __    __ | |
 #    | |  |__   __|   /  ___ \\ |__  ___|| |  | | | ___ \\ \\ \\  / / | |
 #    | |     | |      | |   \\_|   | |   | |  | | | |  | | \\ \\/ /  | |
 #    | |     | |  __  |  \\___     | |   | |  | | | |  | |  \\  /   | |
 #    | |  _  | | |__|  \\___  \\    | |   | |  | | | |  | |   | |   | |
 #    | | | | | |       _   \\  |   | |   | |  | | | |  | |   | |   | |
 #    | | | |_| |      | |__/  |   | |   | |__| | | |__/ |   | |   | |
 #    | | \\_____/      \\______/    |_|   \\______/ |_____/    |_|   | |
 #    | |__________________________________________________________| |
 #    |                                                              |
 #    |  * * * * * * * * * * *    へようこそ   * * * * * * * * * * * |
 #    |______________________________________________________________|

 #    hit v to start a vocabulary study session, k for a kanji session
 #                            or hit q to quit
 #  "
 #  lesson_type = $stdin.gets.chomp
 #  lesson_type
 # end

 # def get_jlpt_level
 #  jlpt_level = ""
 #  levels = ["1", "2", "3", "4", "5"]
 #  until (levels.include?(jlpt_level)) do
 #   puts "\n\n>>Choose your JLPT level, 1 through 5\n\n"
 #   jlpt_level = $stdin.gets.chomp
 #  end
 #  jlpt_level
 # end

 # def start_practicing(lesson_type, jlpt_level)
 #  if lesson_type == "k"
 #   lesson_type = "kanji"
 #  else
 #   lesson_type = "vocabulary"
 #  end
 #  puts "\n\n>>The lesson type is #{lesson_type} and the JLPT difficulty level is N#{jlpt_level}.\n\n"
 # end


end