class Environment
 def self.database_connection
  @connection ||= SQLite3::Database.new("db/jstudy_test.sqlite3")
 end
end