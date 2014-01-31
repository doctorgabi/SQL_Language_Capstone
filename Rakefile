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
 Environment.environment = "production"
 database = Environment.database_connection
 create_tables(database)
end

desc 'prepare the test database'
task :test_prepare do
 File.delete("db/jstudy_test.sqlite3")
 Environment.environment = "test"
 database = Environment.database_connection
 create_tables(database)
end

def create_tables(database_connection)
 database_connection.execute("CREATE TABLE words (id INTEGER PRIMARY KEY AUTOINCREMENT,
  kanji varchar(5),
  onyomi varchar(50),
  kunyomi varchar(50),
  english varchar(50),
  jlptlevel varchar(2),
  category varchar(15)
  )")
 database_connection.execute("CREATE TABLE skills (id INTEGER PRIMARY KEY AUTOINCREMENT,
  english_to_pronunciation integer,
  pronunciation_to_english integer,
  kanji_to_english integer,
  english_to_kanji integer,
  kanji_to_pronunciation integer,
  pronunciation_to_kanji integer,
  e_p_reps integer,
  p_e_reps integer,
  k_e_reps integer,
  e_k_reps integer,
  k_p_reps integer,
  p_k_reps integer
  )")
end
