#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/environment'
require 'rake/testtask'

Rake::TestTask.new() do |t|
 t.pattern = "test/test*.rb"
end

desc "Run tests"
task :default => :test

desc 'create the production database setup'
task :bootstrap_database do
 database = Environment.database_connection("production")
 create_tables(database)
end

desc 'prepare the test database'
task :test_prepare do
 File.delete("db/jstudy_test.sqlite3")
 database = Environment.database_connection("test")
 create_tables(database)
end

def create_tables(database_connection)
 database_connection.execute("CREATE TABLE words (id INTEGER PRIMARY KEY AUTOINCREMENT, kanji varchar(5), onyomi varchar(50), kunyomi varchar(50), english varchar(50), jlptlevel varchar(2), category varchar(15))")
end
