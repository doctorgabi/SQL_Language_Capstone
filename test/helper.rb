require 'minitest/autorun'
require_relative '../lib/environment'

class JstudyTest < MiniTest::Unit::TestCase

 def database
  Environment.database_connection
 end


 def teardown
  database.execute("delete from words")
 end


 def assert_command_output expected, command
  actual = `#{command}`.strip
  assert_equal expected, actual
 end


end