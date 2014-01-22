#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/environment'
require 'rake/testtask'
Rake::TestTask.new() do |t|
 t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

task :bootstrap_database do
 require 'sqlite3'
 database = Environment.database_connection
 database.execute("CREATE TABLE words (id INTEGER PRIMARY KEY AUTOINCREMENT, kanji varchar(5), onyomi varchar(50), kunyomi varchar(50), english varchar(50), jlptlevel varchar(2), category varchar(15))")
end
task :test do
 ruby 'test/test.rb'
end
