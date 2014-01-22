require 'minitest/autorun'

class JstudyTest < MiniTest::Unit::TestCase

 def database
  @database ||= SQLite3::Database.new("db/jstudy_test.sqlite3")
 end


 def teardown
  database.execute("delete from words")
 end


 def assert_command_output expected, command
  actual = `#{command}`.strip
  assert_equal expected, actual
 end


end