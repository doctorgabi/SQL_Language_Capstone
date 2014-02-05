#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/environment'
require 'active_record'

require 'rake/testtask'
Rake::TestTask.new(test: "db:test:prepare") do |t|
 t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

# desc 'create the production database setup'
# task :bootstrap_database do
#  Environment.environment = "production"
#  database = Environment.database_connection
#  create_tables(database)
# end

# desc 'prepare the test database'
# task :test_prepare do
#  File.delete("db/jstudy_test.sqlite3")
#  Environment.environment = "test"
#  database = Environment.database_connection
#  create_tables(database)
# end

# def create_tables(database_connection)
#  database_connection.execute("CREATE TABLE words (id INTEGER PRIMARY KEY AUTOINCREMENT, kanji varchar(5), onyomi varchar(50), kunyomi varchar(50), english varchar(50), jlptlevel varchar(2), category varchar(15))")
#  database_connection.execute("CREATE TABLE skills (id INTEGER PRIMARY KEY AUTOINCREMENT, english_to_pronunciation teger, pronunciation_to_english integer, kanji_to_english integer, english_to_kanji integer, kanji_to_pronunciation integer, pronunciation_to_kanji integer, e_p_reps integer, p_e_reps integer, k_e_reps integer, e_k_reps integer, k_p_reps integer, p_k_reps integer)")
# end
db_namespace = namespace :db do
   desc "Migrate the db"
   task :migrate do
     Environment.environment = 'production'
     Environment.connect_to_database
     ActiveRecord::Migrator.migrate("db/migrate/")
     db_namespace["schema:dump"].invoke
   end
   namespace :test do
     desc "Prepare the test database"
     task :prepare do
       Environment.environment = 'test'
       Environment.connect_to_database
       file = ENV['SCHEMA'] || "db/schema.rb"
       if File.exists?(file)
         load(file)
       else
         abort %{#{file} doesn't exist yet. Run `rake db:migrate` to create it.}
       end
     end
   end
   desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
   task :rollback do
     Environment.environment = 'production'
     Environment.connect_to_database
     step = ENV['STEP'] ? ENV['STEP'].to_i : 1
     ActiveRecord::Migrator.rollback(ActiveRecord::Migrator.migrations_paths, step)
     db_namespace["schema:dump"].invoke
   end
   namespace :schema do
     desc 'Create a db/schema.rb file that can be portably used against any DB supported by AR'
     task :dump do
       require 'active_record/schema_dumper'
       Environment.environment = 'production'
       Environment.connect_to_database
       filename = ENV['SCHEMA'] || "db/schema.rb"
       File.open(filename, "w:utf-8") do |file|
         ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
       end
     end
   end
  end